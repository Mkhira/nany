// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_update_parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUpdateParentModel _$PostUpdateParentModelFromJson(
        Map<String, dynamic> json) =>
    PostUpdateParentModel(
      fullName: json['full_name'] as String?,
      userName: json['user_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      image: json['image'] as String?,
      cityId: json['city_id'] as int?,
      gender: json['gender'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$PostUpdateParentModelToJson(
        PostUpdateParentModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob,
      'image': instance.image,
      'city_id': instance.cityId,
      'gender': instance.gender,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
