import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class GetImagesService {
  String userNum;
  String userToken;
  GetImagesService({required this.userNum, required this.userToken});
  Future<Response<dynamic>> getImages() async {
    Response<dynamic> response = await APIManger.get(
      "user/getImages/$userNum?token=$userToken",
    );
    return response;
  }
}
