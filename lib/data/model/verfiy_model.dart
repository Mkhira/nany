





import 'package:json_annotation/json_annotation.dart';


part 'verfiy_model.g.dart';

@JsonSerializable()
class VerfiyModel {
  int? status;
  String? message;
  dynamic data;

  VerfiyModel({this.status, this.message, this.data});
  factory VerfiyModel.fromJson(Map<String, dynamic> json) => _$VerfiyModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerfiyModelToJson(this);
}
