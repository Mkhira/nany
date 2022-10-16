import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/data/network/api.dart';

import '../model/dto_model/login_model.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginModel loginModel);

  Future<LoginResponseModel> register(RegisterModel registerModel);
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel);
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel);
  Future<BasicResponseModel> changPassword(ChangePassword changePassword);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<LoginResponseModel> login(LoginModel loginModel) {
    return _appServiceClient.login(loginModel);
  }

  @override
  Future<LoginResponseModel> register(RegisterModel registerModel) {
    return _appServiceClient.register(registerModel);
  }

  @override
  Future<BasicResponseModel> changPassword(ChangePassword changePassword) {
    return _appServiceClient.changePassword(changePassword);
  }

  @override
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel) {
    return _appServiceClient.checkEmail(checkEmailModel);
  }

  @override
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel) {
    return _appServiceClient.verifyCode(verifyCodeModel);
  }
}
