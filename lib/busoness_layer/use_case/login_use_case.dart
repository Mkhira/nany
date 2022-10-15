import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

class LoginUseCase extends BaseCase<LoginModel, LoginResponseModel> {
  final Repository _repository;

  LoginUseCase(this._repository);
  @override
  Future<LoginResponseModel> execute(LoginModel input) async {
    LoginResponseModel loginResponseModel = await _repository.login(input);
    if (loginResponseModel.status! == 200) {
      SettingsProvider.current.saveUser(loginResponseModel.data!);
    }

    return loginResponseModel;
  }
}
