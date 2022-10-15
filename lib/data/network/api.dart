import 'package:dio/dio.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constant.dart';
import '../model/dto_model/login_model.dart';

part 'api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponseModel> login(@Body() LoginModel loginModel);
  @POST('/register')
  Future<LoginResponseModel> register(@Body() RegisterModel registerModel);
}
