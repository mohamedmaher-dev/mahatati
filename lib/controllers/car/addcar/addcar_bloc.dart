// ignore_for_file: use_build_context_synchronously, unnecessary_import, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/conditions/addcar_cond.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/core/exceptions/dio_exp.dart';
import 'package:mahatati/core/components/my_loading.dart';
import 'package:mahatati/features/add_car/views/widgets/add_city_sheet.dart';
import 'package:mahatati/features/add_car/views/widgets/add_material_sheet.dart';
import 'package:mahatati/features/add_car/views/widgets/add_quant_sheet.dart';
import 'package:mahatati/models/cond_model.dart';
import 'package:mahatati/models/oldnumcound_model.dart';
import 'package:mahatati/models/user_model.dart';
import 'package:mahatati/services/apis/get/checknum_service.dart';
import 'package:mahatati/services/apis/get/getcond_service.dart';
import 'package:mahatati/services/apis/get/getoldnumcount_service.dart';
import 'package:mahatati/services/apis/post/addcar_service.dart';
import 'package:mahatati/services/apis/get/getcities_service.dart';
import 'package:mahatati/services/apis/get/getmaterial_service.dart';
import 'package:mahatati/services/apis/get/getquants_service.dart';
import 'package:mahatati/services/apis/post/uploadimag_service.dart';
import 'package:mahatati/services/imagepicker_service.dart';

import '../../../features/auth/presentation/views/view_models/login/login_bloc.dart';
part 'addcar_event.dart';
part 'addcar_state.dart';

class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  late UserModel userModel;
  late CondModel condModel;
  late OldNumCount oldNumCount;
  late String value;
  late Response<dynamic> getCitiesResponse;
  late Response<dynamic> materialResponse;
  late Response<dynamic> quantsResponse;
  late Response<dynamic> fieldResponse;
  late Response<dynamic> imagesResponse;
  late Response<dynamic> condsResponse;
  late Response<dynamic> oldNumCountResponse;
  late Response<dynamic> searchNumResponse;
  bool uploadImagesSuccess = true;
  bool isNumber = false;
  String? citySelected;
  String? materialSelected;
  String? quantsSelected;
  String? numRepeat;
  List<File> imagesList = [];
  TextEditingController valueController = TextEditingController();
  TextEditingController kilo1Controller = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController oldNumController = TextEditingController();
  TextEditingController yCarController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController idenController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  AddCarBloc() : super(AddCarInitial()) {
    on<AddCarEvent>(
      (event, emit) async {
        switch (event) {
          case InitAddCarEvent():
            {
              initAddCarMethod(event);
            }
            break;

          case GetCitiesEvent():
            {
              await getCitiesMethod(event);
            }
            break;

          case SelectCityEvent():
            {
              selectCityMethod(event, emit);
            }
            break;
          case GetMaterilaAddEvent():
            {
              await getMaterialsMethod(event);
            }
            break;

          case MaterialSelectedAddEvent():
            {
              selectMaterialMethod(event, emit);
            }
            break;
          case GetQuantsAddEvent():
            {
              await getQuantsMethod(event);
            }
            break;

          case QuantsSelectedAddEvent():
            {
              selectQuantMethod(event, emit);
            }
            break;

          case AddImageEvent():
            {
              await addImageMethod(emit);
            }
            break;
          case DeleteImageEvent():
            {
              deleteImageMethod(event, emit);
            }
            break;

          case BackClickEvent():
            {
              backMethod(event);
            }
            break;

          case AddEvent():
            {
              await addCarMethod(event);
            }
            break;
          case SearchNumber():
            {
              await searchNum();
            }
            break;
        }
      },
    );
  }

  Future<void> searchNum() async {
    if (valueController.text.isEmpty) {
      MyLoading().error("ادخل الرقم");
    } else {
      MyLoading().loading();
      searchNumResponse = await CheckNumService(
        userNum: valueController.text,
        userToken: userModel.userToken,
      ).checkNum();
      if (searchNumResponse.statusCode == 200) {
        MyLoading().error('للأسف يوجد سيارة تحمل نفس الرقم');
      } else {
        MyLoading().success('لم يتم العثور علي سيارة');
      }
    }
  }

  Future<void> addCarMethod(AddEvent event) async {
    try {
      if (AddCarCond(
        context: event.context,
        isNumber: isNumber,
      ).cond()["cond"]) {
        MyLoading().loading();
        condsResponse = await GetCondService(
          userToken: userModel.userToken,
        ).getCond();
        if (condsResponse.statusCode == 200) {
          MyLoading().dismiss();
          condModel = CondModel.fromJson(data: condsResponse.data);
          numRepeat =
              condModel.repeatOldNum == "allowed" ? "enable" : "disable";
          if (condModel.addImage == "required" && imagesList.length != 3) {
            MyLoading().error("يجب اختيار 3 صور");
          } else {
            if (condModel.addOldNum == "not required") {
              await uploadImages();
              await uploadDataCar(event);
            } else {
              if (oldNumController.text.trim().isNotEmpty) {
                MyLoading().loading();
                oldNumCountResponse = await GetOldNumCountService(
                  oldNum: oldNumController.text,
                  userToken: userModel.userToken,
                ).get();
                if (oldNumCountResponse.statusCode == 200) {
                  MyLoading().dismiss();
                  oldNumCount = OldNumCount.fromJson(
                    data: oldNumCountResponse.data,
                  );
                  showDialog(
                    context: event.context,
                    builder: (contextDialog) {
                      return oldNumCountDialog(contextDialog, event);
                    },
                  );
                } else {
                  MyLoading().error("هناك مشكلة في الخادم");
                }
              } else {
                MyLoading().error("يجب كتابة الرقم السابق");
              }
            }
          }
        } else {
          MyLoading().error("هناك مشكلة في الخادم");
        }
      } else {
        MyLoading().error("${AddCarCond(
          context: event.context,
          isNumber: isNumber,
        ).cond()["msg"]}");
      }
    } on DioException catch (e) {
      MyLoading().error(DioExp(dioException: e).getExp());
    }
  }

  AlertDialog oldNumCountDialog(BuildContext contextDialog, AddEvent event) {
    return AlertDialog(
      title: const Text("تحذير"),
      content: Text(
        oldNumCount.carCount == "0"
            ? "لا يوجد سيارات تحمل نفس الرقم السابق , هل تريد المتابعة؟"
            : "يوجد عدد ${oldNumCount.carCount} سيارة تحمل نفس الرقم السابق",
      ),
      actions: [
        Row(
          children: [
            if (condModel.repeatOldNum == "allowed" ||
                condModel.repeatOldNum == "not allowed" &&
                    oldNumCount.carCount == "0")
              MaterialButton(
                child: const Text(
                  "متابعة",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                onPressed: () async {
                  Navigator.of(contextDialog).pop();
                  await uploadImages();
                  await uploadDataCar(event);
                },
              ),
            const Spacer(),
            MaterialButton(
              child: const Text(
                "الغاء",
                style: TextStyle(
                    color: kRedColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(contextDialog).pop();
              },
            ),
          ],
        )
      ],
    );
  }

  void backMethod(BackClickEvent event) {
    Navigator.of(event.context).pop();
  }

  void deleteImageMethod(DeleteImageEvent event, Emitter<AddCarState> emit) {
    imagesList.removeAt(event.index);
    emit(AddCarInitial());
  }

  Future<void> addImageMethod(Emitter<AddCarState> emit) async {
    if (imagesList.length < 3) {
      File? image;
      image = await ImagePickerService().pickImage();
      if (image != null) {
        imagesList.add(image);
        emit(AddCarInitial());
      }
    } else {
      MyLoading().error("لا يمكن اضافة اكثر من ثلاث صور");
    }
  }

  void selectQuantMethod(
      QuantsSelectedAddEvent event, Emitter<AddCarState> emit) {
    quantsSelected = event.quantsSelected;
    Navigator.of(event.context).pop();
    MyLoading().success("تم اختيار الكمية بنجاح");
    emit(AddCarInitial());
  }

  Future<void> getQuantsMethod(GetQuantsAddEvent event) async {
    if (materialSelected != null) {
      try {
        MyLoading().loading();
        quantsResponse = await GetQuantsService(
          material: materialSelected!,
          userToken: userModel.userToken,
        ).getQuants();
        if (quantsResponse.statusCode == 200) {
          MyLoading().dismiss();
          showModalBottomSheet(
            context: event.context,
            builder: (contextBottom) {
              return AddQuantSheet(
                  quantsList: quantsResponse.data["quantities"]);
            },
          );
        } else {
          MyLoading().error("هناك مشكلة في الخادم");
        }
      } on DioException catch (e) {
        MyLoading().error(DioExp(dioException: e).getExp());
      }
    } else {
      MyLoading().error("يجب اختيار المادة اولا");
    }
  }

  void selectMaterialMethod(
      MaterialSelectedAddEvent event, Emitter<AddCarState> emit) {
    materialSelected = event.materialSelected;
    quantsSelected = null;
    Navigator.of(event.context).pop();
    MyLoading().success("تم اختيار المادة بنجاح");
    emit(AddCarInitial());
  }

  Future<void> getMaterialsMethod(GetMaterilaAddEvent event) async {
    try {
      MyLoading().loading();
      materialResponse = await GetMaterialService(
        userToken: userModel.userToken,
      ).getMaterial();
      if (materialResponse.statusCode == 200) {
        MyLoading().dismiss();
        showModalBottomSheet(
          context: event.context,
          builder: (contextBottom) {
            return AddMaterialSheet(materialList: materialResponse.data);
          },
        );
      } else {
        MyLoading().error("هناك مشكلة في الخادم");
      }
    } on DioException catch (e) {
      MyLoading().error(DioExp(dioException: e).getExp());
    }
  }

  void selectCityMethod(SelectCityEvent event, Emitter<AddCarState> emit) {
    citySelected = event.city;
    Navigator.of(event.context).pop();
    MyLoading().success("تم اختيار المدينة بنجاح");
    emit(AddCarInitial());
  }

  Future<void> getCitiesMethod(GetCitiesEvent event) async {
    try {
      MyLoading().loading();
      getCitiesResponse = await GetCitiesService(
        userToken: userModel.userToken,
      ).getCities();
      if (getCitiesResponse.statusCode == 200) {
        MyLoading().dismiss();
        showModalBottomSheet(
          context: event.context,
          builder: (context) {
            return AddCitySheet(citiesList: getCitiesResponse.data);
          },
        );
      } else {
        MyLoading().error("هناك مشكلة في الخادم");
      }
    } on DioException catch (e) {
      MyLoading().error(DioExp(dioException: e).getExp());
    }
  }

  void initAddCarMethod(InitAddCarEvent event) {
    uploadImagesSuccess = true;
    valueController.clear();
    kilo1Controller.clear();
    plateController.clear();
    modelController.clear();
    ownerController.clear();
    notesController.clear();
    oldNumController.clear();
    yCarController.clear();
    colorController.clear();
    idenController.clear();
    mobileController.clear();
    imagesList.clear();
    userModel = BlocProvider.of<LoginBloc>(event.context).userModel;
    isNumber = event.isNumber;
    if (isNumber) {
      value = event.value;
    } else {
      value = event.value;
    }
  }

  Future<void> uploadDataCar(AddEvent event) async {
    if (uploadImagesSuccess) {
      MyLoading().loading(message: "جاري ارسال البيانات");
      fieldResponse = await AddCarService(
        userToken: userModel.userToken,
        carNum: isNumber ? value : valueController.text,
        carQR: isNumber ? valueController.text : value,
        kilo1: kilo1Controller.text,
        plate: plateController.text.trim().isEmpty ? "0" : plateController.text,
        model:
            modelController.text.trim().isEmpty ? "null" : modelController.text,
        owner:
            ownerController.text.trim().isEmpty ? "null" : ownerController.text,
        user: userModel.userName,
        station: userModel.userStation,
        city: citySelected!,
        notes:
            notesController.text.trim().isEmpty ? "null" : notesController.text,
        material: materialSelected!,
        quants: quantsSelected!,
        oldnum: oldNumController.text.trim().isEmpty
            ? "null"
            : oldNumController.text,
        color:
            colorController.text.trim().isEmpty ? "null" : colorController.text,
        ycar: yCarController.text.trim().isEmpty ? "0" : yCarController.text,
        iden: idenController.text.trim().isEmpty ? "null" : idenController.text,
        mob: mobileController.text.trim().isEmpty ? "0" : mobileController.text,
        numRepeat: condModel.repeatOldNum == "allowed" ? "enable" : "disable",
      ).addCar();
      if (fieldResponse.statusCode == 200) {
        print("=========== ${fieldResponse.data}");
        MyLoading().error(
          isNumber ? "رمز QR مستخدم من قبل" : "الرقم مستخدم من قبل",
        );
      } else if (fieldResponse.statusCode == 201) {
        MyLoading().success("تم اضافة بيانات السيارة بنجاح");
        Navigator.of(event.context).pop();
      } else {
        MyLoading().error("هناك مشكلة في الخادم");
      }
    }
  }

  Future<void> uploadImages() async {
    if (imagesList.isNotEmpty) {
      MyLoading().loading(message: "جاري ارسال الصور");
      for (int i = 0; i < imagesList.length; i++) {
        try {
          imagesResponse = await UploadImageService(
            userToken: userModel.userToken,
            carNum: isNumber ? value : valueController.text,
            image: imagesList[i],
          ).upload();
          if (imagesResponse.statusCode != 200) {
            uploadImagesSuccess == false;
            MyLoading().error("خطأ في ارسال الصور");
          }
        } catch (e) {
          uploadImagesSuccess == false;
          MyLoading().error("خطأ في ارسال الصور");
        }
      }
    }
  }
}
