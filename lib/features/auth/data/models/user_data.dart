class UserDataModel {
  String id;
  String username;
  String phone;
  String date;
  String status;
  String isactive;

  UserDataModel({
    required this.id,
    required this.username,
    required this.phone,
    required this.date,
    required this.status,
    required this.isactive,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json['id'].toString(),
        username: json['username'].toString(),
        phone: json['phone'].toString(),
        date: json['date'].toString(),
        status: json['status'].toString(),
        isactive: json['isactive'].toString(),
      );
}
