import 'package:dio/dio.dart';
import 'package:mahatati/core/networking/api_manger.dart';

class AddCarService {
  String userToken;
  String carNum;
  String carQR;
  String kilo1;
  String plate;
  String model;
  String owner;
  String user;
  String station;
  String city;
  String notes;
  String material;
  String quants;
  String oldnum;
  String color;
  String ycar;
  String mob;
  String iden;
  String numRepeat;
  AddCarService({
    required this.userToken,
    required this.carNum,
    required this.carQR,
    required this.kilo1,
    required this.plate,
    required this.model,
    required this.owner,
    required this.user,
    required this.station,
    required this.city,
    required this.notes,
    required this.material,
    required this.quants,
    required this.oldnum,
    required this.color,
    required this.ycar,
    required this.mob,
    required this.iden,
    required this.numRepeat,
  });
  Future<Response<dynamic>> addCar() async {
    Response<dynamic> response = await APIManger.postData(
      "user/addCar?token=$userToken",
      {
        "number": carNum,
        "qr": carQR,
        "Kilo1": kilo1,
        "plate": plate,
        "model": model,
        "owner": owner,
        "notes": notes,
        "user": user,
        "station": station,
        "quantity": quants,
        "material": material,
        "city": city,
        "oldnum": oldnum,
        "color": color,
        "ycar": ycar,
        "mob": mob,
        "iden": iden,
        "num_repeat": numRepeat,
      },
    );
    return response;
  }
}
