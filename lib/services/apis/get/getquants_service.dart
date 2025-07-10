import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class GetQuantsService {
  String userToken;
  String material;
  GetQuantsService({required this.material, required this.userToken});
  final Dio dio = Dio();
  Future<Response<dynamic>> getQuants() async {
    Response<dynamic> response = await APIManger.get(
      "user/getMaterialQuantities/$material?token=$userToken",
    );
    return response;
  }
}
