// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nanny_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NannySearchFilterModel _$NannySearchFilterModelFromJson(
        Map<String, dynamic> json) =>
    NannySearchFilterModel(
      cityId: json['city_id'] as int?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      specialNeeds: json['special_needs'] as bool?,
      minPrice: json['min_price'] as int?,
      maxPrice: json['max_price'] as String?,
      dateFrom: json['date_from'] as String?,
      dateTo: json['date_to'] as String?,
      distance: json['distance'] as String?,
      entryTime: json['entry_time'] as String?,
      exitTime: json['exit_time'] as String?,
      lessonType: json['lesson_type'] as int?,
      noChild: json['no_child'] as int?,
      rate: json['rate'] as String?,
      sisterType: json['sister_type'] as int?,
    );

Map<String, dynamic> _$NannySearchFilterModelToJson(
        NannySearchFilterModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'city_id': instance.cityId,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'entry_time': instance.entryTime,
      'exit_time': instance.exitTime,
      'no_child': instance.noChild,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'rate': instance.rate,
      'distance': instance.distance,
      'special_needs': instance.specialNeeds,
      'sister_type': instance.sisterType,
      'lesson_type': instance.lessonType,
    };
