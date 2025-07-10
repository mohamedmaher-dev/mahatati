import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class CheckQRService {
  String userQR;
  String userToken;
  CheckQRService({required this.userQR, required this.userToken});
  Future<Response<dynamic>> checkQR() async {
    Response<dynamic> response = await APIManger.get(
      "user/checkQr/$userQR?token=$userToken",
    );
    return response;
  }
}
