// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verfiy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerfiyModel _$VerfiyModelFromJson(Map<String, dynamic> json) => VerfiyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$VerfiyModelToJson(VerfiyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
