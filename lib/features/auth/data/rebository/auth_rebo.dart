import 'package:dio/dio.dart';

abstract class AuthRebo {
  Future<Response<dynamic>> login({
    required String phone,
    required String password,
  });
  Future<Response<dynamic>> getStations({
    required String token,
    required String userPhone,
  });

  Future<Response<dynamic>> getUserData({
    required String token,
    required String userID,
  });
}
