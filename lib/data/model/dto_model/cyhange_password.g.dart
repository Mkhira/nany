// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cyhange_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePassword _$ChangePasswordFromJson(Map<String, dynamic> json) =>
    ChangePassword(
      email: json['email'] as String,
      password: json['new_password'] as String,
    );

Map<String, dynamic> _$ChangePasswordToJson(ChangePassword instance) =>
    <String, dynamic>{
      'email': instance.email,
      'new_password': instance.password,
    };
