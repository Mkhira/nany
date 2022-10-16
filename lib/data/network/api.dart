import 'package:dio/dio.dart';
import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
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
  @POST('/verify-code')
  Future<LoginResponseModel> verifyCode(@Body() VerifyCodeModel verifyCodeModel);
  @POST('/check-email')
  Future<BasicResponseModel> checkEmail(@Body() CheckEmailModel checkEmailModel);
  @POST('/change-forget-password')
  Future<BasicResponseModel> changePassword(@Body() ChangePassword changePassword);
}
