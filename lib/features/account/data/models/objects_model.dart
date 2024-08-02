import 'dart:convert';

List<ObjectsModel> objectsModelFromJson(String str) => List<ObjectsModel>.from(
    json.decode(str).map((x) => ObjectsModel.fromJson(x)));

String objectsModelToJson(List<ObjectsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObjectsModel {
  String id;
  String name;
  ObjectsData data;

  ObjectsModel({
    required this.id,
    required this.name,
    required this.data,
  });

  factory ObjectsModel.fromJson(Map<String, dynamic> json) => ObjectsModel(
        id: json["id"],
        name: json["name"],
        data: ObjectsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data.toJson(),
      };
}

class ObjectsData {
  String date;
  double price;
  int type;

  ObjectsData({
    required this.date,
    required this.price,
    required this.type,
  });

  factory ObjectsData.fromJson(Map<String, dynamic> json) => ObjectsData(
        date: json["date"],
        price: json["price"]?.toDouble(),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "price": price,
        "type": type,
      };
}
