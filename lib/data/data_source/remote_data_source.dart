import 'package:nanny_co/data/model/dto_model/apointments.dart';
import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/dto_model/book/parent_booking.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/child/add_child.dart';
import 'package:nanny_co/data/model/dto_model/child/child_response.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite_response.dart';
import 'package:nanny_co/data/model/dto_model/favourit/get_favourite_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_details.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/post_appointment_data.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/data/model/updae_parent_model.dart';
import 'package:nanny_co/data/model/verfiy_model.dart';
import 'package:nanny_co/data/network/api.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';

import '../model/dto_model/login_model.dart';
import '../model/dto_model/registter_sitter_model.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginModel loginModel);

  Future<LoginResponseModel> registerParent(RegisterModelParent registerModel);
  Future<LoginResponseModel> registerSitter(RegisterModelSitter registerModel);
  Future<LoginResponseModel> updateParent(ParentUpdateModel parentUpdateModel);
  Future<LoginResponseModel> updateSister(PostUpdateSisterProfileModel postUpdateSisterProfileModel);
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel);
  Future<VerfiyModel> verifyCode(VerifyCodeModel verifyCodeModel);
  Future<BasicResponseModel> changPassword(ChangePassword changePassword);
  Future<CitiesModel> getCities();
  Future<FavouriteDto> getFavourite();
  Future<AddFavouriteResponse> addRemoveFavourite(AddFavoriteDto addFavoriteDto);
  Future<SearchForNannyModel> searchForNanny(NannySearchFilterModel filterModel);
  Future<dynamic> addChild(AddChildModel addChildModel);
  Future<dynamic> deleteChild(String id);
  Future<ChildResponse> getChild();
  Future<NannyDetails> getNannyDetails(String id);
  Future<Appointments> getAppointments();
  Future<dynamic> postAppointments(PostAppointment postAppointment);
  Future<dynamic> confirmBook(BookPostModel bookPostModel);
  Future<Bookings> getParentBooking(String flag);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<LoginResponseModel> login(LoginModel loginModel) {
    return _appServiceClient.login(loginModel);
  }

  @override
  Future<LoginResponseModel> registerParent(RegisterModelParent registerModel) {
    return _appServiceClient.registerParent(registerModel);
  }
  @override
  Future<LoginResponseModel> registerSitter(RegisterModelSitter registerModel) {
    return _appServiceClient.registerSitter(registerModel);
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
  Future<VerfiyModel> verifyCode(VerifyCodeModel verifyCodeModel) {
    return _appServiceClient.verifyCode(verifyCodeModel);
  }

  @override
  Future<CitiesModel> getCities() {
    return _appServiceClient.getCities();
  }

  @override
  Future<LoginResponseModel> updateParent(ParentUpdateModel parentUpdateModel) {
    return _appServiceClient.updateParent(
      token: 'Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}',
      full_name: parentUpdateModel.postUpdateParentModel.fullName,
     user_name:  parentUpdateModel.postUpdateParentModel.userName,
     email:  parentUpdateModel.postUpdateParentModel.email,
     phone:  parentUpdateModel.postUpdateParentModel.phone,
     dob:  parentUpdateModel.postUpdateParentModel.dob,
     image:  parentUpdateModel.postUpdateParentModel.image,
    city_id:   parentUpdateModel.postUpdateParentModel.cityId,
    gender:   parentUpdateModel.postUpdateParentModel.gender,
     lat:  parentUpdateModel.postUpdateParentModel.lat,
     lng:  parentUpdateModel.postUpdateParentModel.lng,
     address:  parentUpdateModel.postUpdateParentModel.address,
    );
  }

  @override
  Future<LoginResponseModel> updateSister(PostUpdateSisterProfileModel postUpdateSisterProfileModel) {
    print('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}');
    return _appServiceClient.updateSister(
        token: 'Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}',
    address:postUpdateSisterProfileModel.address,city_id: postUpdateSisterProfileModel.cityId,course_name: postUpdateSisterProfileModel.courseName,
    dob: postUpdateSisterProfileModel.dob,education_city: postUpdateSisterProfileModel.educationCity,
      email: postUpdateSisterProfileModel.email,full_name: postUpdateSisterProfileModel.fullName,
      gender: postUpdateSisterProfileModel.gender,
        ID_Number: postUpdateSisterProfileModel.idNumber,
      ID_type: postUpdateSisterProfileModel.idType,
      image: postUpdateSisterProfileModel.image,
      lat: postUpdateSisterProfileModel.lat,
      lng: postUpdateSisterProfileModel.lng,
      lessons_type: postUpdateSisterProfileModel.lessonsType,
      max_price: postUpdateSisterProfileModel.maxPrice,
      min_price: postUpdateSisterProfileModel.minPrice,
      no_of_children: postUpdateSisterProfileModel.noOfChildren,
      phone: postUpdateSisterProfileModel.phone,
      sitter_type: postUpdateSisterProfileModel.sitterType,
      special_needs: postUpdateSisterProfileModel.specialNeeds,
      total_experience: postUpdateSisterProfileModel.totalExperience,
      university_name: postUpdateSisterProfileModel.universityName,
      user_name: postUpdateSisterProfileModel.userName


    );
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
  Future<SearchForNannyModel> searchForNanny(NannySearchFilterModel filterData) async {
    filterData.toJson().removeWhere((key, value) => value == null);
    Map<String, dynamic> data = {};
    filterData.toJson().forEach((key, value) {
      if (value != null) {
        data.addAll({key: value});
      }
    });

    return _appServiceClient.searchForNanny('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', data);
  }

  @override
  Future addChild(AddChildModel addChildModel) {
       return _appServiceClient.addChild(token: 'Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', name: addChildModel.name, age: addChildModel.age, image: addChildModel.image, gender: addChildModel.gander, special_need: addChildModel.specialNeed,id: addChildModel.id);
  }

  @override
  Future deleteChild(String id) {
   return _appServiceClient.deleteChild('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', id);
  }

  @override
  Future<ChildResponse> getChild() {
     return _appServiceClient.getChild('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}');
  }

  @override
  Future<NannyDetails> getNannyDetails(String id) {
    return _appServiceClient.getNannyDetails('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', id);
  }

  @override
  Future<Appointments> getAppointments() {
    return _appServiceClient.getAppointments('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}');
  }

  @override
  Future postAppointments(PostAppointment postAppointment) {
    return _appServiceClient.addAppointmentNanny('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', postAppointment);
  }

  @override
  Future confirmBook(BookPostModel bookPostModel) {
    return _appServiceClient.confirmBook('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}', bookPostModel);

  }

  @override
  Future<Bookings> getParentBooking(String flag) {
       return _appServiceClient.getBooking('Bearer ${SettingsProvider.current.appSettings.userData?.jwtToken}',flag);
  }
}
