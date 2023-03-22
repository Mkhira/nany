// To parse this JSON data, do
//
//     final bookings = bookingsFromJson(jsonString);

import 'dart:convert';

import 'package:nanny_co/data/model/dto_model/pagination/pagination.dart';

Bookings bookingsFromJson(String str) => Bookings.fromJson(json.decode(str));

String bookingsToJson(Bookings data) => json.encode(data.toJson());

class Bookings {
  Bookings({
    required this.status,
    required this.message,
    this.data,
  });

  int status;
  String message;
  Data? data;

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.data,
    this.links,
    this.meta,
  });

  List<BokingData>? data;
  LinksDto? links;
  MetaDto? meta;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<BokingData>.from(json["data"].map((x) => BokingData.fromJson(x))),
    links: LinksDto.fromJson(json["links"]),
    meta: MetaDto.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class BokingData {
  BokingData({
    this.id,
    this.price,
    this.sitterType,
    this.fullName,
    this.userName,
    this.phone,
    this.city,
    this.statusId,
    this.date,
    this.entryTime,
    this.exitTime,
    this.paymentMode,
    this.distance,
    this.rate,
    this.childrenList,
  });

  int ?id;
  String? price;
  String ?sitterType;
  String ?fullName;
  String ?userName;
  String ?phone;
  String ?city;
  int ?statusId;
  String ?date;
  String ?entryTime;
  String ?exitTime;
  String ?paymentMode;
  String ?distance;
  String ?rate;
  List<ChildrenList>? childrenList;

  factory BokingData.fromJson(Map<String, dynamic> json) => BokingData(
    id: json["id"],
    price: json["price"],
    sitterType: json["sitter_type"],
    fullName: json["full_name"],
    userName: json["user_name"],
    phone: json["phone"],
    city: json["city"],
    statusId: json["status_id"],
    date: json["date"],
    entryTime: json["entry_time"],
    exitTime: json["exit_time"],
    paymentMode: json["payment_mode"],
    distance: json["distance"],
    rate: json["rate"],
    childrenList: List<ChildrenList>.from(json["children_list"].map((x) => ChildrenList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "sitter_type": sitterType,
    "full_name": fullName,
    "user_name": userName,
    "phone": phone,
    "city": city,
    "status_id": statusId,
    "date": date,
    "entry_time": entryTime,
    "exit_time": exitTime,
    "payment_mode": paymentMode,
    "distance": distance,
    "rate": rate,
    "children_list": List<dynamic>.from(childrenList!.map((x) => x.toJson())),
  };
}

class ChildrenList {
  ChildrenList({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.specialNeed,
    this.image,
  });

  String? id;
  String? name;
  String ?age;
  String ?gender;
  String ?specialNeed;
  String ?image;

  factory ChildrenList.fromJson(Map<String, dynamic> json) => ChildrenList(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    specialNeed: json["special_need"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "gender": gender,
    "special_need": specialNeed,
    "image": image,
  };
}

