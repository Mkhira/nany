import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';

import '../../data/model/dto_model/basic_response.dart';
import '../../data/model/dto_model/cyhange_password.dart';

abstract class Repository {
  Future<LoginResponseModel> login(LoginModel loginModel);

  Future<LoginResponseModel> register(RegisterModel registerModel);
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel);
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel);
  Future<BasicResponseModel> changPassword(ChangePassword changePassword);
}
