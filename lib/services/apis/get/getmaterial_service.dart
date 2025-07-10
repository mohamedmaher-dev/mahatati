import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class GetMaterialService {
  String userToken;
  GetMaterialService({required this.userToken});
  Future<Response<dynamic>> getMaterial() async {
    Response<dynamic> response = await APIManger.get(
      "user/getMaterials?token=$userToken",
    );
    return response;
  }
}
