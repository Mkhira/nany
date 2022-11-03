import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/domain/repository/repository.dart';
import 'package:nanny_co/domain/use_case/base_use_case.dart';
import 'package:nanny_co/instance.dart';

class SisterUpdateUseCase extends BaseCase<PostUpdateSisterProfileModel, LoginResponseModel> {
  final Repository _repository = injector.get<Repository>();

  @override
  Future<LoginResponseModel> execute(PostUpdateSisterProfileModel input) async {
    LoginResponseModel loginResponseModel = await _repository.updateSister(input);
    if (loginResponseModel.status! == 200) {
      SettingsProvider.current.saveUser(loginResponseModel.data!);
    }

    return loginResponseModel;
  }
}
