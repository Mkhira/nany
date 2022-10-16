import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

class VerifyUseCase extends BaseCase<VerifyCodeModel, LoginResponseModel> {
  final Repository _repository;

  VerifyUseCase(this._repository);
  @override
  Future<LoginResponseModel> execute(VerifyCodeModel input) async {
    return await _repository.verifyCode(input);
  }
}
