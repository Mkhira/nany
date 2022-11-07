import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

class ChangePasswordUseCase extends BaseCase<ChangePassword, BasicResponseModel> {
  final Repository _repository;

  ChangePasswordUseCase(this._repository);
  @override
  Future<BasicResponseModel> execute(ChangePassword input) async {
    return await _repository.changPassword(input);
  }
}
