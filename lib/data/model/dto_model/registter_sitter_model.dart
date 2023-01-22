



import 'package:json_annotation/json_annotation.dart';
part 'registter_sitter_model.g.dart';
@JsonSerializable()
class RegisterModelSitter {
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
  @JsonKey(name: "lesson_type")
  final String lessonType;
  @JsonKey(name: "sitter_type")
  final String sitterType;

  RegisterModelSitter(
      {required this.fullName,
        required this.userName,
        required this.password,
        required this.phone,
        required this.email,
        required this.appType,
        required this.firebaseToken,
        required this.lessonType,
        required this.sitterType,
        required this.deviceToken});

  factory RegisterModelSitter.fromJson(Map<String, dynamic> json) => _$RegisterModelSitterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelSitterToJson(this);
}