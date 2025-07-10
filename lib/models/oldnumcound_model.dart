class OldNumCount {
  String carCount;
  OldNumCount({required this.carCount});
  factory OldNumCount.fromJson({required Map data}) {
    return OldNumCount(
      carCount: data["car_count"].toString(),
    );
  }
}
