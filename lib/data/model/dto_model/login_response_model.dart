import 'package:json_annotation/json_annotation.dart';

import 'auth_data_response.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  int? status;
  String? message;
  AuthDataResponse? data;

  LoginResponseModel({this.status, this.message, this.data});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
