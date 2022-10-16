import 'package:json_annotation/json_annotation.dart';
part 'check_email_model.g.dart';

@JsonSerializable()
class CheckEmailModel {
  final String? email;
  final int? flag;

  CheckEmailModel({this.email, this.flag});
  factory CheckEmailModel.fromJson(Map<String, dynamic> json) => _$CheckEmailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckEmailModelToJson(this);
}
