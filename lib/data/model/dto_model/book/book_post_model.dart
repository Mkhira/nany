




// To parse this JSON data, do
//
//     final bookPostModel = bookPostModelFromJson(jsonString);

import 'dart:convert';

BookPostModel bookPostModelFromJson(String str) => BookPostModel.fromJson(json.decode(str));

String bookPostModelToJson(BookPostModel data) => json.encode(data.toJson());

class BookPostModel {
  BookPostModel({
   required this.appointmentId,
    required  this.date,
    required   this.totalCost,
    required this.sitterType,
    required this.sitterId,
    required this.paymentMode,
    required this.childIds,
  });

  String? appointmentId;
  String ?date;
  String? totalCost;
  String ?sitterType;
  String? sitterId;
  String? paymentMode;
  String childIds;

  factory BookPostModel.fromJson(Map<String, dynamic> json) => BookPostModel(
    appointmentId: json["appointment_id"],
    date: json["date"],
    totalCost: json["total_cost"],
    sitterType: json["sitter_type"],
    sitterId: json["sitter_id"],
    paymentMode: json["payment_mode"],
    childIds: json['child_ids']
  );

  Map<String, dynamic> toJson() => {
    "appointment_id": appointmentId,
    "date": date,
    "total_cost": totalCost,
    "sitter_type": sitterType,
    "sitter_id": sitterId,
    "payment_mode": paymentMode,
    "child_ids": childIds,
  };
}
