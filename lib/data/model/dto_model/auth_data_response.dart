import 'package:json_annotation/json_annotation.dart';

part 'auth_data_response.g.dart';

@JsonSerializable()
class AuthDataResponse {
  int? id;
  String? image;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'user_name')
  String? userName;
  String? email;
  String? phone;
  @JsonKey(name: 'jwt_token')
  String? jwtToken;
  @JsonKey(name: 'app_type')
  String? appType;

  AuthDataResponse({this.id, this.image, this.fullName, this.userName, this.email, this.phone, this.jwtToken, this.appType});

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) => _$AuthDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataResponseToJson(this);
}
