import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class GetOldNumCountService {
  String userToken;
  String oldNum;
  GetOldNumCountService({required this.oldNum, required this.userToken});
  Future<Response<dynamic>> get() async {
    Response<dynamic> response = await APIManger.get(
      "user/getCarsNumber/$oldNum?token=$userToken",
    );
    return response;
  }
}
