import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

class RegisterUseCase extends BaseCase<RegisterModel, LoginResponseModel> {
  final Repository _repository;

  RegisterUseCase(this._repository);
  @override
  Future<LoginResponseModel> execute(RegisterModel input) async {
    LoginResponseModel loginResponseModel = await _repository.register(input);

    return loginResponseModel;
  }
}
