import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class CheckNumService {
  String userNum;
  String userToken;
  CheckNumService({required this.userNum, required this.userToken});
  Future<Response<dynamic>> checkNum() async {
    Response<dynamic> response = await APIManger.get(
      "user/checkNumber/$userNum?token=$userToken",
    );
    return response;
  }
}
