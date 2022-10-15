import 'package:json_annotation/json_annotation.dart';
import 'package:nanny_co/data/model/dto_model/auth_data_response.dart';

part 'app_settings.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSettings {
  AuthDataResponse? userData;
  String? fireBaseToken;
  String? deviceToken;
  AppSettings({this.userData});
  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
