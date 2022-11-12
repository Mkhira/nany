import 'package:json_annotation/json_annotation.dart';

part 'cities_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CitiesModel {
  CitiesModel({
    required this.status,
    required this.message,
    this.data,
  });

  final int status;
  final String message;
  final CitiesResponse? data;

  factory CitiesModel.fromJson(Map<String, dynamic> json) => _$CitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CitiesResponse {
  CitiesResponse({
    this.data,
  });

  final List<CityModel>? data;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => _$CitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesResponseToJson(this);
}

@JsonSerializable()
class CityModel {
  CityModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
