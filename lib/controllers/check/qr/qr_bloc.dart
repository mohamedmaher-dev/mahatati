// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/addcar/addcar_bloc.dart';
import 'package:mahatati/controllers/car/updatecar/updatecar_bloc.dart';
import 'package:mahatati/core/exceptions/dio_exp.dart';
import 'package:mahatati/core/components/my_loading.dart';
import 'package:mahatati/models/car_model.dart';
import 'package:mahatati/models/user_model.dart';
import 'package:mahatati/services/apis/get/checkqr_service.dart';

import '../../../features/auth/presentation/views/view_models/login/login_bloc.dart';
part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  late BuildContext context;
  bool flashIsEnable = false;
  late UserModel userModel;
  late Response<dynamic> response;
  late String qrValue;

  QrBloc() : super(CheckQrInitial()) {
    on<QrEvent>(
      (event, emit) async {
        switch (event) {
          case InitEvent():
            {
              initMethod(event);
            }
            break;

          case BackClickEvent():
            {
              backMethod(event);
            }
            break;
          case StartScannQREvent():
            {
              startScannMethod(event);
            }
            break;

          case DetectedQREvent():
            {
              await detectedQRMethod(event);
            }
            break;
        }
      },
    );
  }

  Future<void> detectedQRMethod(DetectedQREvent event) async {
    qrValue = event.qrValue;
    Navigator.of(event.context).pop();
    try {
      MyLoading().loading();
      response = await CheckQRService(
        userQR: event.qrValue,
        userToken: userModel.userToken,
      ).checkQR();
      if (response.statusCode == 200) {
        MyLoading().success("تم العثور علي بيانات");
        BlocProvider.of<UpdateCarBloc>(context).carModel =
            CarModel.fromJson(data: response.data[0]);
        Navigator.of(context).pushNamed("updatecar");
      } else if (response.statusCode == 404) {
        MyLoading().error("الرقم غير موجود قم بادخال بيانات جديده له");
        BlocProvider.of<AddCarBloc>(context).add(
            InitAddCarEvent(isNumber: false, value: qrValue, context: context));
        Navigator.of(context).pushNamed("addcar");
      } else {
        MyLoading().error("حدث خطأ ما");
      }
    } on DioException catch (e) {
      MyLoading().error(DioExp(dioException: e).getExp());
    }
  }

  void startScannMethod(StartScannQREvent event) {
    context = event.context;
    Navigator.of(event.context).pushNamed("scann");
  }

  void backMethod(BackClickEvent event) {
    Navigator.of(event.context).pop();
  }

  void initMethod(InitEvent event) {
    userModel = BlocProvider.of<LoginBloc>(event.context).userModel;
  }
}
