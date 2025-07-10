// ignore_for_file: use_build_context_synchronously, avoid_print, depend_on_referenced_packages, unnecessary_import
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
import 'package:mahatati/services/apis/get/checknum_service.dart';

import '../../../features/auth/presentation/views/view_models/login/login_bloc.dart';
part 'num_event.dart';
part 'num_state.dart';

class NumBloc extends Bloc<NumEvent, NumState> {
  TextEditingController phoneField = TextEditingController();
  late UserModel userModel;
  late Response<dynamic> response;
  NumBloc() : super(CheckNumInitial()) {
    on<NumEvent>(
      (event, emit) async {
        switch (event) {
          case BackClickEvent():
            {
              backClickMethod(event);
            }
            break;
          case CheckClickEvent():
            {
              await checkNumMethod(event);
            }
            break;
          case InitEvent():
            {
              initMethod(event);
            }
            break;
        }
      },
    );
  }

  void initMethod(InitEvent event) {
    userModel = BlocProvider.of<LoginBloc>(event.context).userModel;
  }

  Future<void> checkNumMethod(CheckClickEvent event) async {
    if (phoneField.text.isNotEmpty) {
      try {
        MyLoading().loading();
        response = await CheckNumService(
          userNum: phoneField.text,
          userToken: userModel.userToken,
        ).checkNum();
        if (response.statusCode == 200) {
          MyLoading().success("تم العثور علي بيانات");
          BlocProvider.of<UpdateCarBloc>(event.context).carModel =
              CarModel.fromJson(data: response.data[0]);
          Navigator.of(event.context).pushNamed("updatecar");
        } else if (response.statusCode == 404) {
          MyLoading().error("الرقم غير موجود قم بادخال بيانات جديده له");
          BlocProvider.of<AddCarBloc>(event.context).add(InitAddCarEvent(
              isNumber: true, value: phoneField.text, context: event.context));
          Navigator.of(event.context).pushNamed("addcar");
        } else {
          MyLoading().error("حدث خطأ ما");
        }
        phoneField.clear();
      } on DioException catch (e) {
        MyLoading().error(DioExp(dioException: e).getExp());
      }
    } else {
      MyLoading().error("ادخل الرقم");
    }
  }

  void backClickMethod(BackClickEvent event) {
    Navigator.of(event.context).pop();
  }
}
