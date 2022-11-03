import 'package:json_annotation/json_annotation.dart';

part 'post_update_parent.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostUpdateParentModel {
  final String? fullName;
  final String? userName;
  final String email;
  final String phone;
  final DateTime? dob;
  final String? image;
  final int? cityId;
  final String? gender;
  final String? lat;
  final String? lng;
  final String? address;

  PostUpdateParentModel(
      {this.fullName,
      this.userName,
      required this.email,
      required this.phone,
      this.dob,
      this.image,
      this.cityId,
      this.gender,
      this.lat,
      this.lng,
      this.address});

  factory PostUpdateParentModel.fromJson(Map<String, dynamic> json) => _$PostUpdateParentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostUpdateParentModelToJson(this);
}
