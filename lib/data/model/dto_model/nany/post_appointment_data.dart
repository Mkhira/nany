// To parse this JSON data, do
//
//     final appointmentResponse = appointmentResponseFromJson(jsonString);

import 'dart:convert';

PostAppointment appointmentResponseFromJson(String str) => PostAppointment.fromJson(json.decode(str));

String appointmentResponseToJson(PostAppointment data) => json.encode(data.toJson());

class PostAppointment {
  PostAppointment({
    required this.date,
  required  this.timeFrom,
    required this.timeTo,
  });

  final String date;
  final String timeFrom;
  final String timeTo;

  factory PostAppointment.fromJson(Map<String, dynamic> json) => PostAppointment(
    date: json["date"],
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}
