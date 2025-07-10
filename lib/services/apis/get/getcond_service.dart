import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class GetCondService {
  String userToken;
  GetCondService({required this.userToken});
  Future<Response<dynamic>> getCond() async {
    Response<dynamic> response = await APIManger.get(
      "user/getConditions?token=$userToken",
    );
    return response;
  }
}
