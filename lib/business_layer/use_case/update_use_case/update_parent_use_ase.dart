import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/updae_parent_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class UpdateParentUseCase extends BaseCase<ParentUpdateModel, LoginResponseModel> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<LoginResponseModel> execute(ParentUpdateModel input) async {
    LoginResponseModel loginResponseModel = await _repository.updateParent(input);
    if (loginResponseModel.status! == 200) {
      SettingsProvider.current.saveUser(loginResponseModel.data!);
    }

    return loginResponseModel;
  }
}
