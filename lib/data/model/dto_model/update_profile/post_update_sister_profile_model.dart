import 'dart:io';



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
  final String? dob;
  final File? image;
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


}
