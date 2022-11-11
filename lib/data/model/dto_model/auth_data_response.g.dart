// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDataResponse _$AuthDataResponseFromJson(Map<String, dynamic> json) =>
    AuthDataResponse(
      id: json['id'] as int,
      image: json['image'] as String?,
      fullName: json['full_name'] as String?,
      userName: json['user_name'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      jwtToken: json['jwt_token'] as String,
      appType: json['app_type'] as String,
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
      expiredDate: json['expired_date'] as String?,
      lessonsType: json['lessons_type'] as int?,
      minPrice: json['min_price'] as String?,
      maxPrice: json['max_price'] as String?,
      noOfChildren: json['no_of_children'] as int?,
    );

Map<String, dynamic> _$AuthDataResponseToJson(AuthDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'full_name': instance.fullName,
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'jwt_token': instance.jwtToken,
      'app_type': instance.appType,
      'dob': instance.dob?.toIso8601String(),
      'city_id': instance.cityId,
      'gender': instance.gender,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'sitter_type': instance.sitterType,
      'course_name': instance.courseName,
      'university_name': instance.universityName,
      'education_city': instance.educationCity,
      'total_experience': instance.totalExperience,
      'special_needs': instance.specialNeeds,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
      'expired_date': instance.expiredDate,
      'lessons_type': instance.lessonsType,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'no_of_children': instance.noOfChildren,
    };
