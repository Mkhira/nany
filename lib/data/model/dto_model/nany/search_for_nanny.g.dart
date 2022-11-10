// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_for_nanny.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchForNannyModel _$SearchForNannyModelFromJson(Map<String, dynamic> json) =>
    SearchForNannyModel(
      status: json['status'] as int,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : NannySearchResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchForNannyModelToJson(
        SearchForNannyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

NannySearchResponse _$NannySearchResponseFromJson(Map<String, dynamic> json) =>
    NannySearchResponse(
      nannyCount: json['nanny_count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NannySearch.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : LinksDto.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NannySearchResponseToJson(
        NannySearchResponse instance) =>
    <String, dynamic>{
      'nanny_count': instance.nannyCount,
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };

NannySearch _$NannySearchFromJson(Map<String, dynamic> json) => NannySearch(
      id: json['id'] as int,
      nannyName: json['nanny_name'] as String?,
      rate: json['rate'] as String?,
      distance: json['distance'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$NannySearchToJson(NannySearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nanny_name': instance.nannyName,
      'rate': instance.rate,
      'distance': instance.distance,
      'price': instance.price,
    };
