// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      userData: json['userData'] == null
          ? null
          : AuthDataResponse.fromJson(json['userData'] as Map<String, dynamic>),
      isFirstTime: json['isFirstTime'] as bool? ?? true,
      isLogin: json['isLogin'] as bool? ?? false,
    )
      ..fireBaseToken = json['fireBaseToken'] as String?
      ..deviceToken = json['deviceToken'] as String?;

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'userData': instance.userData?.toJson(),
      'fireBaseToken': instance.fireBaseToken,
      'deviceToken': instance.deviceToken,
      'isFirstTime': instance.isFirstTime,
      'isLogin': instance.isLogin,
    };
