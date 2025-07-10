import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class GetCitiesService {
  String userToken;

  GetCitiesService({required this.userToken});

  Future<Response<dynamic>> getCities() async {
    Response<dynamic> response = await APIManger.get(
      "user/getCities?token=$userToken",
    );
    return response;
  }
}
