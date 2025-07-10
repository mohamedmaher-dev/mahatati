// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mahatati/core/exceptions/dio_exp.dart';
import 'package:mahatati/core/components/my_loading.dart';
import 'package:mahatati/features/auth/data/errors/login_response_error.dart';
import 'package:mahatati/features/auth/data/errors/stations_response_error.dart';
import 'package:mahatati/features/auth/data/errors/user_data_response_error.dart';
import 'package:mahatati/features/auth/data/models/login_model.dart';
import 'package:mahatati/features/auth/data/models/station_model.dart';
import 'package:mahatati/features/auth/data/models/user_data.dart';
import 'package:mahatati/features/auth/data/rebository/auth_rebo.dart';
import 'package:mahatati/features/auth/data/rebository/rebos/auth_remote_rebo.dart';
import 'package:mahatati/models/user_model.dart';
import '../../widgets/selection_view.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRebo authRebo = AuthRemoteRebo();
  List<StationModel> stationList = [];
  TextEditingController phoneField = TextEditingController();
  TextEditingController passField = TextEditingController();
  bool isHide = true;
  bool isRemeber = false;
  late BuildContext context;
  late UserModel userModel;
  late LoginModel loginModel;
  late UserDataModel userDataModel;
  late Response<dynamic> loginResponse;
  late Response<dynamic> stationResponse;
  late Response<dynamic> userDataResponse;
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        switch (event) {
          case ChangeHidePass():
            {
              changeHidePassMethod(emit);
            }
            break;
          case ChangeRememberMe():
            {
              changeRememberMeMethod(emit);
            }
            break;
          case LoginClickEvent():
            {
              await loginMethod(event);
            }
            break;
          case StationSelectedEvent():
            {
              stationSelectedMethod(event);
            }
            break;
        }
      },
    );
  }

  void stationSelectedMethod(StationSelectedEvent event) {
    userModel = UserModel.fromJson(
      token: loginModel.token,
      userStation: event.station,
      userID: userDataModel.id,
      userName: userDataModel.username,
    );
    Navigator.of(event.context).pop();
    Navigator.of(context).pushReplacementNamed("home");
    MyLoading().success("تم تسجيل الدخول بنجاح");
  }

  Future<void> loginMethod(LoginClickEvent event) async {
    if (phoneField.text.isNotEmpty && passField.text.isNotEmpty) {
      // Loading Dialog
      MyLoading().loading();
      // Try To Login
      try {
        loginResponse = await authRebo.login(
          phone: phoneField.text,
          password: passField.text,
        );
        print(loginResponse.statusCode);
      } on DioException catch (e) {
        MyLoading().error(DioExp(dioException: e).getExp());
      }
      // check login process is sucess
      if (loginResponse.statusCode == 200) {
        // create loginModel
        loginModel = LoginModel.fromJson(loginResponse.data);
        // check user is active
        if (loginModel.isactive) {
          // try to get user data
          try {
            userDataResponse = await authRebo.getUserData(
              token: loginModel.token,
              userID: loginModel.userId,
            );
          } on DioException catch (e) {
            MyLoading().error(DioExp(dioException: e).getExp());
          }
          if (userDataResponse.statusCode == 200) {
            // create userDataModel
            userDataModel = UserDataModel.fromJson(userDataResponse.data);
            // try to get stations
            try {
              stationResponse = await authRebo.getStations(
                  token: loginModel.token, userPhone: phoneField.text);
            } on DioException catch (e) {
              MyLoading().error(DioExp(dioException: e).getExp());
            }
            // create stationsList
            stationList.clear();
            for (int i = 0; i < stationResponse.data.length; i++) {
              stationList.add(StationModel.fromJson(stationResponse.data[i]));
            }
            if (stationResponse.statusCode == 200) {
              MyLoading().dismiss();
              context = event.context;
              showDialog(
                context: event.context,
                builder: (contextBottom) {
                  return Scaffold(
                    body: SelectStationView(
                      listStations: stationList,
                    ),
                  );
                },
              );
            } else {
              MyLoading().error(
                  GetStationsRespnseError.error(stationResponse.statusCode!));
            }
          } else {
            MyLoading().error(
                GetUserDataRespnseError.error(userDataResponse.statusCode!));
          }
        } else {
          MyLoading().error("هذا المستخدم غير مسموح له بالدخول");
        }
      } else {
        MyLoading().error(LoginRespnseError.error(loginResponse.statusCode!));
      }
    } else {
      MyLoading().error("ادخل رقم الهاتف و كلمة المرور");
    }
  }

  void changeRememberMeMethod(Emitter<LoginState> emit) {
    isRemeber = !isRemeber;
    emit(LoginInitial());
  }

  void changeHidePassMethod(Emitter<LoginState> emit) {
    isHide = !isHide;
    emit(LoginInitial());
  }
}
