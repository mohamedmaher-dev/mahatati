class StationModel {
  String id;
  String userId;
  String stationNumber;
  String stationName;

  StationModel(
      {required this.id,
      required this.userId,
      required this.stationNumber,
      required this.stationName});

  factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
        id: json['id'].toString(),
        userId: json['user_id'].toString(),
        stationNumber: json['station_number'].toString(),
        stationName: json['station_name'].toString(),
      );
}
