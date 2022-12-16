import 'package:nanny_co/data/model/dto_model/apointments.dart';
import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/dto_model/book/parent_booking.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/child/add_child.dart';
import 'package:nanny_co/data/model/dto_model/child/child_response.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite_response.dart';
import 'package:nanny_co/data/model/dto_model/favourit/get_favourite_model.dart';
import 'package:nanny_co/data/model/dto_model/login_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_details.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_search_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/post_appointment_data.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:nanny_co/data/model/updae_parent_model.dart';

import '../../data/model/dto_model/basic_response.dart';
import '../../data/model/dto_model/cyhange_password.dart';

abstract class Repository {
  Future<LoginResponseModel> login(LoginModel loginModel);

  Future<LoginResponseModel> register(RegisterModel registerModel);
  Future<LoginResponseModel> updateParent(ParentUpdateModel parentUpdateModel);
  Future<LoginResponseModel> updateSister(PostUpdateSisterProfileModel postUpdateSisterProfileModel);
  Future<BasicResponseModel> checkEmail(CheckEmailModel checkEmailModel);
  Future<LoginResponseModel> verifyCode(VerifyCodeModel verifyCodeModel);
  Future<BasicResponseModel> changPassword(ChangePassword changePassword);
  Future<CitiesModel> getCites();
  Future<FavouriteDto> getFavourite();
  Future<AddFavouriteResponse> addRemoveFavourite(AddFavoriteDto addFavoriteDto);

  Future<SearchForNannyModel> searchForNanny(NannySearchFilterModel filterModel);
  Future<dynamic> addChild(AddChildModel addChildModel);
  Future<dynamic> delete(String id);
  Future<ChildResponse> getChild();
  Future<NannyDetails> getNanny(String id);
  Future<dynamic> postAppointment(PostAppointment postAppointment);
  Future<Appointments> getAppointments();
  Future<dynamic> confirmBook(BookPostModel bookPostModel);
  Future<Bookings> getParentBooking();
}
