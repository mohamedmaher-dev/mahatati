// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class UploadImageService {
  String userToken;
  String carNum;
  File image;
  final Dio dio = Dio();
  UploadImageService(
      {required this.userToken, required this.carNum, required this.image});
  Future<Response<dynamic>> upload() async {
    final String url =
        "${APIManger.baseUrl}user/addImages/$carNum?token=$userToken";
    FormData formData = FormData.fromMap(
      {
        "images[]": await MultipartFile.fromFile(image.path),
      },
    );
    Response response = await dio.post(url, data: formData);
    return response;
  }
}
