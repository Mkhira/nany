import 'package:json_annotation/json_annotation.dart';
part 'verify_code.g.dart';

@JsonSerializable()
class VerifyCodeModel {
  final String email;
  final String code;
  VerifyCodeModel({required this.email, required this.code});
  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) => _$VerifyCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeModelToJson(this);
}
