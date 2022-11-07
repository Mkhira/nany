// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteDto _$FavouriteDtoFromJson(Map<String, dynamic> json) => FavouriteDto(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FavouriteResponseDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavouriteDtoToJson(FavouriteDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

FavouriteResponseDto _$FavouriteResponseDtoFromJson(
        Map<String, dynamic> json) =>
    FavouriteResponseDto(
      favouritesCount: json['favourites_count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FavouriteDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : LinksDto.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavouriteResponseDtoToJson(
        FavouriteResponseDto instance) =>
    <String, dynamic>{
      'favourites_count': instance.favouritesCount,
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

FavouriteDataDto _$FavouriteDataDtoFromJson(Map<String, dynamic> json) =>
    FavouriteDataDto(
      id: json['id'] as String?,
      nannyName: json['nanny_name'] as String?,
      rate: json['rate'] as String?,
      distance: json['distance'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$FavouriteDataDtoToJson(FavouriteDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nanny_name': instance.nannyName,
      'rate': instance.rate,
      'distance': instance.distance,
      'price': instance.price,
    };
