import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/busoness_layer/use_case/login_use_case.dart';
import 'package:nanny_co/busoness_layer/use_case/register_use_case.dart';
import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/widget/alerts.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final LoginUseCase _loginUseCase = injector.get<LoginUseCase>();
  final RegisterUseCase _registerUseCase = injector.get<RegisterUseCase>();

  Future<bool> signInWithEmailAndPassword(String email, String password, context) async {
    try {
      LoginResponseModel loginResponseModel = await _loginUseCase.execute(LoginModel(
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
}
