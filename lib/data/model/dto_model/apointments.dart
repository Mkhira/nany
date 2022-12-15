

import 'package:nanny_co/data/model/dto_model/pagination/pagination.dart';



class Appointments {
  Appointments({
   required this.status,
    required this.message,
    this.data,
  });

  int status;
  String message;
  Data? data;

  factory Appointments.fromJson(Map<String, dynamic> json) => Appointments(
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

  List<Datum> ?data;
  LinksDto ?links;
  MetaDto? meta;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: LinksDto.fromJson(json["links"]),
    meta: MetaDto.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class Datum {
  Datum({
   required this.id,
   required this.date,
  required  this.day,
    required this.timeFrom,
    required this.timeTo,
  });

  int id;
  DateTime date;
  String day;
  String timeFrom;
  String timeTo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    day: json["day"],
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "day": day,
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}


