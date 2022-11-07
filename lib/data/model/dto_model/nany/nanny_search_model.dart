import 'package:json_annotation/json_annotation.dart';

part 'nanny_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NannySearchFilterModel {
  NannySearchFilterModel({
    this.cityId,
    this.lat,
    this.lng,
    this.specialNeeds,
    this.minPrice,
    this.maxPrice,
    this.dateFrom,this.dateTo,this.distance,this.entryTime,this.exitTime,this.lessonType,this.noChild,this.rate,this.sisterType
  });

  final String? lat;
  final String? lng;
  final int? cityId;
  final String? dateFrom;
  final String? dateTo;
  final String? entryTime;
  final String? exitTime;
  final int? noChild;
  final int? minPrice;
  final String? maxPrice;
  final String? rate;
  final String? distance;
  final bool? specialNeeds;
  final int? sisterType;
  final int? lessonType;


  factory NannySearchFilterModel.fromJson(Map<String, dynamic> json) => _$NannySearchFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$NannySearchFilterModelToJson(this);
}
