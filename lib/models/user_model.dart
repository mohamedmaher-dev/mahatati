class UserModel {
  String userToken;
  String userStation;
  String userID;
  String userName;
  UserModel({
    required this.userToken,
    required this.userStation,
    required this.userID,
    required this.userName,
  });
  factory UserModel.fromJson({
    required String token,
    required String userStation,
    required String userID,
    required String userName,
  }) {
    return UserModel(
      userToken: token,
      userStation: userStation,
      userID: userID,
      userName: userName,
    );
  }
}
