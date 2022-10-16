import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';

class CheckEmailUseCase extends BaseCase<CheckEmailModel, BasicResponseModel> {
  final Repository _repository;

  CheckEmailUseCase(this._repository);
  @override
  Future<BasicResponseModel> execute(CheckEmailModel input) async {
    return await _repository.checkEmail(input);
  }
}
