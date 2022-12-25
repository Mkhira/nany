import 'package:json_annotation/json_annotation.dart';

part 'auth_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthDataResponse {
  AuthDataResponse({
     this.id,
    this.image,
    this.fullName,
    this.userName,
     this.email,
     this.phone,
     this.jwtToken,
     this.appType,
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
    this.expiredDate,
    this.lessonsType,
    this.minPrice,
    this.maxPrice,
    this.noOfChildren,
  });

  final int? id;
  final String? image;
  final String? fullName;
  final String? userName;
  final String? email;
  final String? phone;
  final String? jwtToken;
  final String? appType;
  final String? dob;
  final int? cityId;
  final String? gender;
  final String? lat;
  final String? lng;
  final String? address;
  final String? sitterType;
  final String? courseName;
  final String? universityName;
  final int? educationCity;
  final int? totalExperience;
  final String? specialNeeds;
  final String? idType;
  final String? idNumber;
  final String? expiredDate;
  final int? lessonsType;
  final String? minPrice;
  final String? maxPrice;
  final int? noOfChildren;

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) => _$AuthDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataResponseToJson(this);
}
