// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_update_sister_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUpdateSisterProfileModel _$PostUpdateSisterProfileModelFromJson(
        Map<String, dynamic> json) =>
    PostUpdateSisterProfileModel(
      image: json['image'] as String?,
      fullName: json['full_name'] as String?,
      userName: json['user_name'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      cityId: json['city_id'] as int?,
      gender: json['gender'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String?,
      sitterType: json['sitter_type'] as String?,
      courseName: json['course_name'] as String?,
      universityName: json['university_name'] as String?,
      educationCity: json['education_city'] as int?,
      totalExperience: json['total_experience'] as int?,
      specialNeeds: json['special_needs'] as String?,
      idType: json['id_type'] as String?,
      idNumber: json['id_number'] as String?,
      lessonsType: json['lessons_type'] as int?,
      minPrice: json['min_price'] as int?,
      maxPrice: json['max_price'] as String?,
      noOfChildren: json['no_of_children'] as String?,
    );

Map<String, dynamic> _$PostUpdateSisterProfileModelToJson(
        PostUpdateSisterProfileModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob?.toIso8601String(),
      'image': instance.image,
      'city_id': instance.cityId,
      'gender': instance.gender,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'course_name': instance.courseName,
      'university_name': instance.universityName,
      'education_city': instance.educationCity,
      'total_experience': instance.totalExperience,
      'special_needs': instance.specialNeeds,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'lessons_type': instance.lessonsType,
      'no_of_children': instance.noOfChildren,
      'sitter_type': instance.sitterType,
    };
