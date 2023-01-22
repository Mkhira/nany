import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

import '../../data/model/dto_model/registter_sitter_model.dart';

class RegisterParentUseCase extends BaseCase<RegisterModelParent, LoginResponseModel> {
  final Repository _repository;

  RegisterParentUseCase(this._repository);
  @override
  Future<LoginResponseModel> execute(RegisterModelParent input) async {
    LoginResponseModel loginResponseModel = await _repository.registerParent(input);

    return loginResponseModel;
  }
}
class RegisterSitterUseCase extends BaseCase<RegisterModelSitter, LoginResponseModel> {
  final Repository _repository;

  RegisterSitterUseCase(this._repository);
  @override
  Future<LoginResponseModel> execute(RegisterModelSitter input) async {
    LoginResponseModel loginResponseModel = await _repository.registerSitter(input);

    return loginResponseModel;
  }
}
