// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favourite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavouriteResponse _$AddFavouriteResponseFromJson(
        Map<String, dynamic> json) =>
    AddFavouriteResponse(
      status: json['status'] as int,
      isFavorite: json['is_favorite'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddFavouriteResponseToJson(
        AddFavouriteResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'is_favorite': instance.isFavorite,
      'message': instance.message,
    };
