// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/details/details_bloc.dart';
import 'package:mahatati/core/exceptions/dio_exp.dart';
import 'package:mahatati/core/components/my_loading.dart';
import 'package:mahatati/models/car_model.dart';
import 'package:mahatati/models/cond_model.dart';
import 'package:mahatati/models/user_model.dart';
import 'package:mahatati/services/apis/get/getcond_service.dart';
import 'package:mahatati/services/apis/get/getimages_service.dart';
import 'package:mahatati/services/apis/get/getmaterial_service.dart';
import 'package:mahatati/services/apis/get/getquants_service.dart';
import 'package:mahatati/services/apis/patch/updatecar_service.dart';
import '../../../features/auth/presentation/views/view_models/login/login_bloc.dart';
import '../../../features/update_car/views/widgets/update_material_sheet.dart';
import '../../../features/update_car/views/widgets/update_quants_sheet.dart';

part 'updatecar_event.dart';
part 'updatecar_state.dart';

class UpdateCarBloc extends Bloc<UpdateCarEvent, UpdateCarState> {
  late UserModel userModel;
  late CarModel carModel;
  late CondModel condModel;
  TextEditingController kilo2Controller = TextEditingController();
  late Response<dynamic> response;
  late Response<dynamic> materialResponse;
  late Response<dynamic> quantsResponse;
  late Response<dynamic> condsResponse;
  late Response<dynamic> updateResponse;
  late List listImagesNames;
  List<String> listImagesLinks = [];
  int activeImages = 0;
  String? kilo2;
  String? materialSelected;
  String? quantsSelected;
  UpdateCarBloc() : super(CarInitial()) {
    on<UpdateCarEvent>(
      (event, emit) async {
        switch (event) {
          case InitUpdateCarEvent():
            {
              initUpdateCarMethod(event, emit);
            }
            break;

          case UpdateClickEvent():
            {
              await updateCarMethod(event);
            }
            break;

          case BackClickEvent():
            {
              backClickMethod(event);
            }
            break;

          case ShowImagesClickEvent():
            {
              await showImagesClickMethod(event);
            }
            break;

          case SlideImageEvent():
            {
              slideImageMethod(event, emit);
            }
            break;

          case GetMaterilaUpdateEvent():
            {
              await getMaterialMethod(event);
            }
            break;

          case MaterialSelectedUpdateEvent():
            {
              materialSelectedMethod(event, emit);
            }
            break;
          case GetQuantsUpdateEvent():
            {
              await getQuantsMethod(event);
            }
            break;

          case QuantsSelectedUpdateEvent():
            {
              quantsSelectedMethod(event, emit);
            }
            break;
          case Kilo2SelectedEvent():
            {
              kilo2SelectedMethod(event, emit);
            }
            break;
          case CopyNumberEvent():
            {
              Clipboard.setData(
                ClipboardData(
                  text: carModel.number!,
                ),
              );
              MyLoading().success("تم نسخ الرقم");
            }
            break;
        }
      },
    );
  }

  void kilo2SelectedMethod(
      Kilo2SelectedEvent event, Emitter<UpdateCarState> emit) {
    Navigator.of(event.context).pop();

    if (kilo2Controller.text.isNotEmpty) {
      kilo2 = kilo2Controller.text;
      MyLoading().success("تم ادخال رقم الكيلو بنجاح");
    } else {
      MyLoading().error("لا يمكن ان يكون الرقم فارغ");
    }

    kilo2Controller.clear();
    emit(CarInitial());
  }

  Future<void> updateCarMethod(UpdateClickEvent event) async {
    if (kilo2 == null || materialSelected == null || quantsSelected == null) {
      MyLoading().error("يجب ادخال البيانات المراد تحديثها");
    } else {
      try {
        MyLoading().loading();
        condsResponse =
            await GetCondService(userToken: userModel.userToken).getCond();
        if (condsResponse.statusCode == 200) {
          condModel = CondModel.fromJson(data: condsResponse.data);
          if (DateTime.now()
                      .toUtc()
                      .difference(DateTime.parse(carModel.updatedAt!).toUtc())
                      .inDays >=
                  int.parse(condModel.days) &&
              int.parse(kilo2!) >= int.parse(condModel.kiloDifference)) {
            try {
              updateResponse = await UpdateCarService(
                userToken: userModel.userToken,
                carID: carModel.id!,
                newKilo: kilo2!,
                quantity: quantsSelected!,
                material: materialSelected!,
                city: carModel.city!,
                station: userModel.userStation,
              ).updateCar();
              if (updateResponse.statusCode == 200) {
                MyLoading().success("تم تحديث البيانات بنجاح");
                Navigator.of(event.context).pop();
              } else {
                MyLoading().error("هناك مشكلة في الخادم");
              }
            } on DioException catch (e) {
              MyLoading().error(DioExp(dioException: e).getExp());
            }
          } else {
            MyLoading().error("لا يمكن تحديث البيانات لعدم اكتمال الشروط");
            DetailsBloc detailsController =
                BlocProvider.of<DetailsBloc>(event.context);
            detailsController.carModel = carModel;
            detailsController.userModel = userModel;
            Navigator.of(event.context).pushReplacementNamed("details");
          }
        } else {
          MyLoading().error("هناك مشكلة في الخادم");
        }
      } on DioException catch (e) {
        MyLoading().error(DioExp(dioException: e).getExp());
      }
    }
  }

  void quantsSelectedMethod(
      QuantsSelectedUpdateEvent event, Emitter<UpdateCarState> emit) {
    quantsSelected = event.quantsSelected;
    Navigator.of(event.context).pop();
    MyLoading().success("تم اختيار الكمية بنجاح");
    emit(CarInitial());
  }

  Future<void> getQuantsMethod(GetQuantsUpdateEvent event) async {
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
              return UpdateQuantsSheet(
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

  void materialSelectedMethod(
      MaterialSelectedUpdateEvent event, Emitter<UpdateCarState> emit) {
    materialSelected = event.materialSelected;
    quantsSelected = null;
    Navigator.of(event.context).pop();
    MyLoading().success("تم اختيار المادة بنجاح");
    emit(CarInitial());
  }

  Future<void> getMaterialMethod(GetMaterilaUpdateEvent event) async {
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
            return UpdateMaterialSheet(materialList: materialResponse.data);
          },
        );
      } else {
        MyLoading().error("هناك مشكلة في الخادم");
      }
    } on DioException catch (e) {
      MyLoading().error(DioExp(dioException: e).getExp());
    }
  }

  void slideImageMethod(SlideImageEvent event, Emitter<UpdateCarState> emit) {
    activeImages = event.index;
    emit(CarInitial());
  }

  Future<void> showImagesClickMethod(ShowImagesClickEvent event) async {
    try {
      MyLoading().loading();
      response = await GetImagesService(
        userNum: carModel.number!,
        userToken: userModel.userToken,
      ).getImages();
      if (response.statusCode == 200) {
        listImagesNames = response.data;
        listImagesLinks.clear();
        for (int i = 0; i < listImagesNames.length; i++) {
          listImagesLinks.add(
              "https://ahmed.ym-apps.com/public/images/${listImagesNames[i]["image_path"]}");
        }
        MyLoading().dismiss();
        if (listImagesLinks.isEmpty) {
          MyLoading().error("لا يوجد صور لعرضها");
        } else {
          Navigator.of(event.context).pushNamed("imagesview");
        }
      } else {
        MyLoading().error("هناك مشكلة في الخادم");
      }
    } on DioException catch (e) {
      MyLoading().error(DioExp(dioException: e).getExp());
    }
  }

  void backClickMethod(BackClickEvent event) {
    Navigator.of(event.context).pop();
  }

  void initUpdateCarMethod(
      InitUpdateCarEvent event, Emitter<UpdateCarState> emit) {
    userModel = BlocProvider.of<LoginBloc>(event.context).userModel;
    kilo2 = null;
    materialSelected = null;
    quantsSelected = null;
    emit(CarInitial());
  }
}
