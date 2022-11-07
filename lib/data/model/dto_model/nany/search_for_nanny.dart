





import 'package:json_annotation/json_annotation.dart';
import 'package:nanny_co/data/model/dto_model/pagination/pagination.dart';
part 'search_for_nanny.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class SearchForNannyModel {
  SearchForNannyModel({
    required this.status,
    this.message,
    this.data,
  });

  final int status;
  final String? message;
  final NannySearchResponse? data;

  factory SearchForNannyModel.fromJson(Map<String, dynamic> json) => _$SearchForNannyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchForNannyModelToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class NannySearchResponse {
  NannySearchResponse({
    this.nannyCount,
    this.data,
    this.links,
    this.meta,
  });

  final int? nannyCount;
  final List<NannySearch>? data;
  final LinksDto? links;
  final MetaDto? meta;
  factory NannySearchResponse.fromJson(Map<String, dynamic> json) => _$NannySearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NannySearchResponseToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class NannySearch {
  NannySearch({
    required this.id,
    this.nannyName,
    this.rate,
    this.distance,
    this.price,
  });

  final int id;
  final String? nannyName;
  final String? rate;
  final String? distance;
  final int? price;
  factory NannySearch.fromJson(Map<String, dynamic> json) => _$NannySearchFromJson(json);

  Map<String, dynamic> toJson() => _$NannySearchToJson(this);
}


