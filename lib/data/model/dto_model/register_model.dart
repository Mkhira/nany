import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModelParent {
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "user_name")
  final String userName;
  final String password;
  final String phone;
  final String email;
  @JsonKey(name: "app_type")
  final String appType;
  @JsonKey(name: "firebase_token")
  final String firebaseToken;
  @JsonKey(name: "device_token")
  final String deviceToken;

  RegisterModelParent(
      {required this.fullName,
      required this.userName,
      required this.password,
      required this.phone,
      required this.email,
      required this.appType,
      required this.firebaseToken,
      required this.deviceToken});

  factory RegisterModelParent.fromJson(Map<String, dynamic> json) => _$RegisterModelParentFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelParentToJson(this);
}

