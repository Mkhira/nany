// To parse this JSON data, do
//
//     final nannyDetails = nannyDetailsFromJson(jsonString);

import 'dart:convert';

NannyDetails nannyDetailsFromJson(String str) => NannyDetails.fromJson(json.decode(str));

String nannyDetailsToJson(NannyDetails data) => json.encode(data.toJson());

class NannyDetails {
  NannyDetails({
   required this.status,
   required this.message,
    this.data,
  });

  int status;
  String message;
  Data? data;

  factory NannyDetails.fromJson(Map<String, dynamic> json) => NannyDetails(
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
   required this.id,
   required this.nannyName,
    this.rate,
    this.image,
    this.distance,
    this.takeCare,
    this.price,
    this.universityName,
    this.totalExperience,
    this.specialNeeds,
    this.sitterGallery,
    this.availability,
  });

  int id;
  String nannyName;
  String ?rate;
  String ?image;
  String ?distance;
  String ?takeCare;
  int ?price;
  String ?universityName;
  int ?totalExperience;
  String ?specialNeeds;
  List<SitterGallery> ?sitterGallery;
  List<Availability> ?availability;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    nannyName: json["nanny_name"],
    rate: json["rate"],
    image: json["image"],
    distance: json["distance"],
    takeCare: json["take_care"],
    price: json["price"],
    universityName: json["university_name"],
    totalExperience: json["total_experience"],
    specialNeeds: json["special_needs"],
    sitterGallery: List<SitterGallery>.from(json["sitter_gallery"].map((x) => SitterGallery.fromJson(x))),
    availability: List<Availability>.from(json["availability"].map((x) => Availability.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nanny_name": nannyName,
    "rate": rate,
    "image": image,
    "distance": distance,
    "take_care": takeCare,
    "price": price,
    "university_name": universityName,
    "total_experience": totalExperience,
    "special_needs": specialNeeds,
    "sitter_gallery": List<dynamic>.from(sitterGallery!.map((x) => x.toJson())),
    "availability": List<dynamic>.from(availability!.map((x) => x.toJson())),
  };
}

class Availability {
  Availability({
    required this.id,
    this.date,
    this.timeFrom,
    this.timeTo,
    this.name,
  });

  int id;
  DateTime? date;
  String? timeFrom;
  String? timeTo;
  String ?name;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "time_from": timeFrom,
    "time_to": timeTo,
    "name": name,
  };
}

class SitterGallery {
  SitterGallery({
    required this.id,
    this.images,
    this.sitterId,
  });

  int id;
  String ?images;
  String ?sitterId;

  factory SitterGallery.fromJson(Map<String, dynamic> json) => SitterGallery(
    id: json["id"],
    images: json["images"],
    sitterId: json["sitter_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": images,
    "sitter_id": sitterId,
  };
}
