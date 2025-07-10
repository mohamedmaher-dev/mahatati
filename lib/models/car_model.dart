class CarModel {
  String? id;
  String? number;
  String? qr;
  String? kilo1;
  String? user;
  String? station;
  String? createdAt;
  String? owner;
  String? plate;
  String? city;
  String? model;
  String? notes;
  String? quantity;
  String? material;
  String? updatedAt;
  String? latestPacking;
  String? oldNum;
  String? color;
  String? yCar;
  String? mob;
  String? iden;
  CarModel({
    required this.id,
    required this.number,
    required this.qr,
    required this.kilo1,
    required this.user,
    required this.station,
    required this.createdAt,
    required this.owner,
    required this.plate,
    required this.city,
    required this.model,
    required this.notes,
    required this.quantity,
    required this.material,
    required this.updatedAt,
    required this.latestPacking,
    required this.oldNum,
    required this.color,
    required this.yCar,
    required this.mob,
    required this.iden,
  });

  factory CarModel.fromJson({required Map data}) {
    return CarModel(
      id: data["id"].toString(),
      number: data["number"].toString(),
      qr: data["qr"].toString(),
      kilo1: data["Kilo1"].toString(),
      user: data["user"].toString(),
      station: data["station"].toString(),
      createdAt: data["create_at"].toString(),
      owner: data["owner"].toString(),
      plate: data["plate"].toString(),
      city: data["city"].toString(),
      model: data["model"].toString(),
      notes: data["notes"].toString(),
      quantity: data["quantity"].toString(),
      material: data["material"].toString(),
      updatedAt: data["updated_at"].toString(),
      latestPacking: data["latest_packing"].toString(),
      oldNum: data["oldnum"].toString(),
      color: data["color"].toString(),
      yCar: data["ycar"].toString(),
      mob: data["mob"].toString(),
      iden: data["iden"].toString(),
    );
  }
}
