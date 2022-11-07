// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksDto _$LinksDtoFromJson(Map<String, dynamic> json) => LinksDto(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'],
      next: json['next'],
    );

Map<String, dynamic> _$LinksDtoToJson(LinksDto instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$MetaDtoToJson(MetaDto instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'links': instance.links,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

LinkDto _$LinkDtoFromJson(Map<String, dynamic> json) => LinkDto(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$LinkDtoToJson(LinkDto instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
