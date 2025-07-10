class CondModel {
  String kiloDifference;
  String days;
  String addImage;
  String addOldNum;
  String repeatOldNum;
  CondModel({
    required this.kiloDifference,
    required this.days,
    required this.addImage,
    required this.addOldNum,
    required this.repeatOldNum,
  });
  factory CondModel.fromJson({required Map data}) {
    return CondModel(
      kiloDifference: data["kilo_difference"].toString(),
      days: data["days"].toString(),
      addImage: data["add_image"].toString(),
      addOldNum: data["add_num"].toString(),
      repeatOldNum: data["repeat_num"].toString(),
    );
  }
}
