import 'package:nanny_co/data/data_source/remote_data_source.dart';
import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite_response.dart';
import 'package:nanny_co/data/model/dto_model/favourit/get_favourite_model.dart';
import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/data/model/updae_parent_model.dart';
import 'package:nanny_co/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  late RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<LoginResponseModel> login(LoginModel loginModel) {
    return _remoteDataSource.login(loginModel);
  }

  @override
  Future<LoginResponseModel> register(RegisterModel registerModel) {
    return _remoteDataSource.register(registerModel);
  }

  @override
  Future<BasicResponseModel> changPassword(ChangePassword changePassword) {
    return _remoteDataSource.changPassword(changePassword);
  }

  @override
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel) {
    return _remoteDataSource.checkEmail(checkEmailModel);
  }

  @override
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel) {
    return _remoteDataSource.verifyCode(verifyCodeModel);
  }

  @override
  Future<CitiesModel> getCites() {
    return _remoteDataSource.getCities();
  }

  @override
  Future<LoginResponseModel> updateParent(ParentUpdateModel parentUpdateModel) {
    return _remoteDataSource.updateParent(parentUpdateModel);
  }

  @override
  Future<LoginResponseModel> updateSister(PostUpdateSisterProfileModel postUpdateSisterProfileModel) {
    return _remoteDataSource.updateSister(postUpdateSisterProfileModel);
  }

  @override
  Future<FavouriteDto> getFavourite() {
    return _remoteDataSource.getFavourite();
  }

  @override
  Future<AddFavouriteResponse> addRemoveFavourite(AddFavoriteDto addFavoriteDto) {
    return _remoteDataSource.addRemoveFavourite(addFavoriteDto);
  }

  @override
  Future<SearchForNannyModel> searchForNanny(NannySearchFilterModel filterModel) {
    return _remoteDataSource.searchForNanny(filterModel);
  }
}
