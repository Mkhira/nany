// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponseModel _$BasicResponseModelFromJson(Map<String, dynamic> json) =>
    BasicResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$BasicResponseModelToJson(BasicResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
