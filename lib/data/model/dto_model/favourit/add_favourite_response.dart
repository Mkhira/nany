




import 'package:json_annotation/json_annotation.dart';
part 'add_favourite_response.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class AddFavouriteResponse {
  AddFavouriteResponse({
   required this.status,
    this.isFavorite,
    this.message,
  });

  final int status;
  final bool? isFavorite;
  final String? message;

  factory AddFavouriteResponse.fromJson(Map<String, dynamic> json) => _$AddFavouriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavouriteResponseToJson(this);
}