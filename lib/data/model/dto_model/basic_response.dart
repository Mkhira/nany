import 'package:json_annotation/json_annotation.dart';
part 'basic_response.g.dart';

@JsonSerializable()
class BasicResponseModel {
  int? status;
  String? message;
  dynamic data;

  BasicResponseModel({this.status, this.message, this.data});
  factory BasicResponseModel.fromJson(Map<String, dynamic> json) => _$BasicResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasicResponseModelToJson(this);
}
