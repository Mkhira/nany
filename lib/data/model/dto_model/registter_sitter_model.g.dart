// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registter_sitter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModelSitter _$RegisterModelSitterFromJson(Map<String, dynamic> json) =>
    RegisterModelSitter(
      fullName: json['full_name'] as String,
      userName: json['user_name'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      appType: json['app_type'] as String,
      firebaseToken: json['firebase_token'] as String,
      lessonType: json['lesson_type'] as String,
      sitterType: json['sitter_type'] as String,
      deviceToken: json['device_token'] as String,
    );

Map<String, dynamic> _$RegisterModelSitterToJson(
        RegisterModelSitter instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'user_name': instance.userName,
      'password': instance.password,
      'phone': instance.phone,
      'email': instance.email,
      'app_type': instance.appType,
      'firebase_token': instance.firebaseToken,
      'device_token': instance.deviceToken,
      'lesson_type': instance.lessonType,
      'sitter_type': instance.sitterType,
    };
