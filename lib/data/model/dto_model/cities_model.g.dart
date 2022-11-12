// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesModel _$CitiesModelFromJson(Map<String, dynamic> json) => CitiesModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CitiesResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitiesModelToJson(CitiesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) =>
    CitiesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesResponseToJson(CitiesResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
