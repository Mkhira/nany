



import 'package:nanny_co/data/model/dto_model/pagination/pagination.dart';
import 'package:json_annotation/json_annotation.dart';
part 'child_response.g.dart';
@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class ChildResponse {
  ChildResponse({
   required this.status,
    required this.message,
    this.data,
  });

  final int status;
  final String message;
  final ChildList? data;
  factory ChildResponse.fromJson(Map<String, dynamic> json) => _$ChildResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChildResponseToJson(this);
}
@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class ChildList {
  ChildList({
  required  this.data,
    this.links,
    this.meta,
  });

  final List<ChildItem> data;
  final LinksDto? links;
  final MetaDto? meta;
  factory ChildList.fromJson(Map<String, dynamic> json) => _$ChildListFromJson(json);

  Map<String, dynamic> toJson() => _$ChildListToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class ChildItem {
  ChildItem({
   required this.id,
   required this.name,
   required this.age,
    required this.gender,
    required this.specialNeed,
  });

  final int id;
  final String name;
  final String age;
  final String gender;
  final String specialNeed;
  factory ChildItem.fromJson(Map<String, dynamic> json) => _$ChildItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChildItemToJson(this);
}

