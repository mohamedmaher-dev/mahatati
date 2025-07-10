import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class UpdateCarService {
  String userToken;
  String carID;
  String newKilo;
  String quantity;
  String material;
  String city;
  String station;
  UpdateCarService(
      {required this.userToken,
      required this.carID,
      required this.newKilo,
      required this.quantity,
      required this.material,
      required this.station,
      required this.city});
  Future<Response<dynamic>> updateCar() async {
    Response<dynamic> response = await APIManger.patch(
      "user/addKilo/$carID?token=$userToken",
      {
        "currentKilo": newKilo,
        "quantity": quantity,
        "material": material,
        "city": city,
        "station": station,
      },
    );
    return response;
  }
}
