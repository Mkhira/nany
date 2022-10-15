// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDataResponse _$AuthDataResponseFromJson(Map<String, dynamic> json) =>
    AuthDataResponse(
      id: json['id'] as int?,
      image: json['image'] as String?,
      fullName: json['full_name'] as String?,
      userName: json['user_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      jwtToken: json['jwt_token'] as String?,
      appType: json['app_type'] as String?,
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
    };
