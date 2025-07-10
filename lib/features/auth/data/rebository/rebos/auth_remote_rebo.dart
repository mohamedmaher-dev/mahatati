import 'package:dio/src/response.dart';
import 'package:mahatati/core/networking/api_manger.dart';
import 'package:mahatati/features/auth/data/rebository/auth_rebo.dart';

class AuthRemoteRebo implements AuthRebo {
  @override
  Future<Response<dynamic>> login({
    required String phone,
    required String password,
  }) async {
    return await APIManger.postData(
      "auth/login",
      {
        "phone": phone,
        "password": password,
      },
    );
  }

  @override
  Future<Response> getStations({
    required String token,
    required String userPhone,
  }) async {
    return await APIManger.get("user/getUserStations/$userPhone?token=$token");
  }

  @override
  Future<Response> getUserData({
    required String token,
    required String userID,
  }) async {
    return await APIManger.get("user/getUserData/$userID?token=$token");
  }
}
