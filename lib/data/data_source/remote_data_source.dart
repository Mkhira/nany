import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite_response.dart';
import 'package:nanny_co/data/model/dto_model/favourit/get_favourite_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_parent.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/data/network/api.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';

import '../model/dto_model/login_model.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginModel loginModel);

  Future<LoginResponseModel> register(RegisterModel registerModel);
  Future<LoginResponseModel> updateParent(PostUpdateParentModel postUpdateParentModel);
  Future<LoginResponseModel> updateSister(PostUpdateSisterProfileModel postUpdateSisterProfileModel);
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel);
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel);
  Future<BasicResponseModel> changPassword(ChangePassword changePassword);
  Future<CitiesModel> getCities();
  Future<FavouriteDto> getFavourite();
  Future<AddFavouriteResponse> addRemoveFavourite(AddFavoriteDto addFavoriteDto);
  Future<SearchForNannyModel> searchForNanny(NannySearchFilterModel filterModel);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<LoginResponseModel> login(LoginModel loginModel) {
    return _appServiceClient.login(loginModel);
  }

  @override
  Future<LoginResponseModel> register(RegisterModel registerModel) {
    return _appServiceClient.register(registerModel);
  }

  @override
  Future<BasicResponseModel> changPassword(ChangePassword changePassword) {
    return _appServiceClient.changePassword(changePassword);
  }

  @override
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel) {
    return _appServiceClient.checkEmail(checkEmailModel);
  }

  @override
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel) {
    return _appServiceClient.verifyCode(verifyCodeModel);
  }

  @override
  Future<CitiesModel> getCities() {
    return _appServiceClient.getCities();
  }

  @override
  Future<LoginResponseModel> updateParent(PostUpdateParentModel postUpdateParentModel) {
    return _appServiceClient.updateParent('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', postUpdateParentModel);
  }

  @override
  Future<LoginResponseModel> updateSister(PostUpdateSisterProfileModel postUpdateSisterProfileModel) {
    return _appServiceClient.updateSister(
        'Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', postUpdateSisterProfileModel);
  }

  @override
  Future<FavouriteDto> getFavourite() {
     return _appServiceClient.getFavorite('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}');
  }

  @override
  Future<AddFavouriteResponse> addRemoveFavourite(AddFavoriteDto addFavoriteDto) {
    return _appServiceClient.addRemoveFavourite('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', addFavoriteDto);
  }

  @override
  Future<SearchForNannyModel> searchForNanny(NannySearchFilterModel filterData)async {

    filterData.toJson().removeWhere((key, value) => value == null);
    Map<String, dynamic> data = {};
    filterData.toJson().forEach((key, value) {
      if (value != null) {
        data.addAll({key: value});
      }
    });

     return _appServiceClient.searchForNanny('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', data);
  }
}
