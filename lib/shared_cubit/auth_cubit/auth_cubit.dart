import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/business_layer/use_case/change_password_use_case.dart';
import 'package:nanny_co/business_layer/use_case/check_email_use_case.dart';
import 'package:nanny_co/business_layer/use_case/login_use_case.dart';
import 'package:nanny_co/business_layer/use_case/register_use_case.dart';
import 'package:nanny_co/business_layer/use_case/verify_use_case.dart';
import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/data/model/verfiy_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/widget/alerts.dart';
import 'package:nanny_co/parent/auth_view/verify.dart';
import 'package:otp_text_field/otp_field.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final LoginUseCase _loginUseCase = injector.get<LoginUseCase>();
  final RegisterUseCase _registerUseCase = injector.get<RegisterUseCase>();
  final CheckEmailUseCase _checkEmailUseCase = injector.get<CheckEmailUseCase>();
  final VerifyUseCase _verifyUseCase = injector.get<VerifyUseCase>();
  final ChangePasswordUseCase _changePasswordUseCase = injector.get<ChangePasswordUseCase>();
  TextEditingController emailController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();

  Future<int> signInWithEmailAndPassword(String email, String password, context) async {
    try {
      LoginResponseModel loginResponseModel = await _loginUseCase.execute(LoginModel(
          email: email,
          password: password,
          firebaseToken: SettingsProvider.current.appSettings.fireBaseToken ?? '',
          deviceToken: SettingsProvider.current.appSettings.fireBaseToken ?? ''));

      print("loginResponseModel.status");
      print(loginResponseModel.status!);
      print(loginResponseModel.status!);
      print(loginResponseModel.status!);
      print(loginResponseModel.status!);
      print(loginResponseModel.status!);
      if (loginResponseModel.status! == 200) {
        return 200;
      }  if (loginResponseModel.status! == 405) {
        return 405;
      }else {
        Alerts.showSnackBar(context: context, message: loginResponseModel.message ?? '');

        return 1;
      }
    } catch (e) {
      print(e);
      print('      loginResponseModel.status');
      Alerts.showSnackBar(context: context, message: 'Check Connection');

      return 1;
    }
  }

  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required context,
    required String fullName,
    required String userName,
    required String phone,
    required String type,
  }) async {
    try {
      LoginResponseModel loginResponseModel = await _registerUseCase.execute(RegisterModel(
          appType: type,
          fullName: fullName,
          phone: phone,
          userName: userName,
          email: email,
          password: password,
          firebaseToken: SettingsProvider.current.appSettings.fireBaseToken ?? '',
          deviceToken: SettingsProvider.current.appSettings.fireBaseToken ?? ''));
      if (loginResponseModel.status! == 200) {
        return true;
      } else {
        Alerts.showSnackBar(context: context, message: loginResponseModel.message ?? '');

        return false;
      }
    } catch (e) {
      Alerts.showSnackBar(context: context, message: 'Check Connection');

      return false;
    }
  }

  Future<bool> checkEmail(String email, BuildContext context) async {
    try {
      BasicResponseModel basicResponseModel = await _checkEmailUseCase.execute(CheckEmailModel(email: email, flag: 2));
      if (basicResponseModel.status! == 200) {
        return true;
      } else {
        Alerts.showSnackBar(context: context, message: basicResponseModel.message ?? '');
        return false;
      }
    } on Exception {
      Alerts.showSnackBar(context: context, message: 'Check Connection');

      return false;
    }
  }

  Future<bool> verifyCode({required String email, required String otp, required BuildContext context}) async {
    try {
      VerfiyModel loginModelResponse = await _verifyUseCase.execute(VerifyCodeModel(email: email, code: otp));
      if (loginModelResponse.status! == 200) {
        return true;
      } else {
        Alerts.showSnackBar(context: context, message: loginModelResponse.message ?? '');
        return false;
      }
    } on Exception {
      Alerts.showSnackBar(context: context, message: 'Check Connection');

      return false;
    }
  }

  Future<bool> changePassword({required String email, required String password, required BuildContext context}) async {
    try {
      BasicResponseModel basicResponseModel = await _changePasswordUseCase.execute(ChangePassword(email: email, password: password));
      if (basicResponseModel.status! == 200) {
        return true;
      } else {
        Alerts.showSnackBar(context: context, message: basicResponseModel.message ?? '');
        return false;
      }
    } on Exception {
      Alerts.showSnackBar(context: context, message: 'Check Connection');

      return false;
    }
  }


String codeValue ='';
  getValueCode(String value){
    codeValue = value;
    emit(AuthInitialCode());

  }
  Future<dynamic> verfiyAcount(String code,BuildContext context)async{
 await injector.get<VerifyUseCase>().execute(VerifyCodeModel(code: codeValue,email: emailController.text));
     Navigator.pop(context);
     Navigator.pop(context);

  }
}

