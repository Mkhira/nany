import 'package:json_annotation/json_annotation.dart';

part 'post_update_sister_profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostUpdateSisterProfileModel {
  PostUpdateSisterProfileModel({
    this.image,
    this.fullName,
    this.userName,
    required this.email,
    required this.phone,
    this.dob,
    this.cityId,
    this.gender,
    this.lat,
    this.lng,
    this.address,
    this.sitterType,
    this.courseName,
    this.universityName,
    this.educationCity,
    this.totalExperience,
    this.specialNeeds,
    this.idType,
    this.idNumber,
    this.lessonsType,
    this.minPrice,
    this.maxPrice,
    this.noOfChildren,
  });
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
  final String? courseName;
  final String? universityName;
  final int? educationCity;
  final int? totalExperience;
  final String? specialNeeds;
  final String? idType;
  final String? idNumber;
  final int? minPrice;
  final String? maxPrice;
  final int? lessonsType;
  final String? noOfChildren;
  final String? sitterType;

  factory PostUpdateSisterProfileModel.fromJson(Map<String, dynamic> json) => _$PostUpdateSisterProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostUpdateSisterProfileModelToJson(this);
}
