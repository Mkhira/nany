



import 'package:json_annotation/json_annotation.dart';
part 'add_favourite.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class AddFavoriteDto{
  final String nannyId;
  AddFavoriteDto({required this.nannyId});
  factory AddFavoriteDto.fromJson(Map<String, dynamic> json) => _$AddFavoriteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavoriteDtoToJson(this);
}