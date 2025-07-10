import 'package:mahatati/core/extensions/string.dart';

class LoginModel {
  String token;
  String userId;
  bool isactive;

  LoginModel({
    required this.token,
    required this.userId,
    required this.isactive,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json['token'].toString(),
        userId: json['userId'].toString(),
        isactive: json['isactive'].toString().toBool(),
      );
}
