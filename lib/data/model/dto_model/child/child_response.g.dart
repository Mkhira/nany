// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildResponse _$ChildResponseFromJson(Map<String, dynamic> json) =>
    ChildResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ChildList.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildResponseToJson(ChildResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

ChildList _$ChildListFromJson(Map<String, dynamic> json) => ChildList(
      data: (json['data'] as List<dynamic>)
          .map((e) => ChildItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : LinksDto.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildListToJson(ChildList instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ChildItem _$ChildItemFromJson(Map<String, dynamic> json) => ChildItem(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      specialNeed: json['special_need'] as String,
    );

Map<String, dynamic> _$ChildItemToJson(ChildItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'special_need': instance.specialNeed,
    };
