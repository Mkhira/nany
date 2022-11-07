



import 'package:json_annotation/json_annotation.dart';
import 'package:nanny_co/data/model/dto_model/pagination/pagination.dart';
part 'get_favourite_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class FavouriteDto {
  FavouriteDto({
    this.status,
    this.message,
    this.data,
  });

  final int? status;
  final String? message;
  final FavouriteResponseDto? data;
  factory FavouriteDto.fromJson(Map<String, dynamic> json) => _$FavouriteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteDtoToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class FavouriteResponseDto {
  FavouriteResponseDto({
    this.favouritesCount,
    this.data,
    this.links,
    this.meta,
  });

  final int? favouritesCount;
  final List<FavouriteDataDto>? data;
  final LinksDto? links;
  final MetaDto? meta;
  factory FavouriteResponseDto.fromJson(Map<String, dynamic> json) => _$FavouriteResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteResponseDtoToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class FavouriteDataDto {
  FavouriteDataDto({
    this.id,
    this.nannyName,
    this.rate,
    this.distance,
    this.price,
  });

  final String? id;
  final String? nannyName;
  final String? rate;
  final String? distance;
  final int? price;
  factory FavouriteDataDto.fromJson(Map<String, dynamic> json) => _$FavouriteDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteDataDtoToJson(this);
}


