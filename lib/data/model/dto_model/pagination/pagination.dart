



import 'package:json_annotation/json_annotation.dart';
part 'pagination.g.dart';
@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class LinksDto {
  LinksDto({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  factory LinksDto.fromJson(Map<String, dynamic> json) => _$LinksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LinksDtoToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)

class MetaDto {
  MetaDto({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<LinkDto>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory MetaDto.fromJson(Map<String, dynamic> json) => _$MetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDtoToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class LinkDto {
  LinkDto({
    this.url,
    this.label,
    this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory LinkDto.fromJson(Map<String, dynamic> json) => _$LinkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LinkDtoToJson(this);
}