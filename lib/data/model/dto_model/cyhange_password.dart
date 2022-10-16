import 'package:json_annotation/json_annotation.dart';
part 'cyhange_password.g.dart';

@JsonSerializable()
class ChangePassword {
  final String email;
  @JsonKey(name: 'new_password')
  final String password;
  ChangePassword({required this.email, required this.password});
  factory ChangePassword.fromJson(Map<String, dynamic> json) => _$ChangePasswordFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordToJson(this);
}
