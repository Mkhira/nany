import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String email;
  final String password;
  @JsonKey(name: "firebase_token")
  final String firebaseToken;
  @JsonKey(name: "device_token")
  final String deviceToken;

  LoginModel({required this.email, required this.password, required this.firebaseToken, required this.deviceToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
