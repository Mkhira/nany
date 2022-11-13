import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nanny_co/data/model/dto_model/basic_response.dart';
import 'package:nanny_co/data/model/dto_model/check_email_model.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/cyhange_password.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite.dart';
import 'package:nanny_co/data/model/dto_model/favourit/add_favourite_response.dart';
import 'package:nanny_co/data/model/dto_model/favourit/get_favourite_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/search_for_nanny.dart';
import 'package:nanny_co/data/model/dto_model/register_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/data/model/dto_model/verify_code.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constant.dart';
import '../model/dto_model/login_model.dart';

part 'api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponseModel> login(@Body() LoginModel loginModel);
  @POST('/register')
  Future<LoginResponseModel> register(@Body() RegisterModel registerModel);
  @POST('/nanny/update-profile')
  Future<LoginResponseModel> updateSister({
    @Header('Authorization') required token,
    @Part() String? full_name,
    @Part() String? user_name,
    @Part() String? email,
    @Part() String? phone,
    @Part() String? dob,
    @Part() File? image,
    @Part() int? city_id,
    @Part() String? gender,
    @Part() String? lat,
    @Part() String? lng,
    @Part() String? address,
    @Part() String? course_name,
    @Part() String? university_name,
    @Part() int? education_ity,
    @Part() int? total_experience,
    @Part() String? special_needs,
    @Part() String? id_type,
    @Part() String? id_number,
    @Part() int? min_price,
    @Part() String? max_price,
    @Part() int? lessons_type,
    @Part() String? no_of_children,
    @Part() String? sitter_type,
  });
  @POST('/nanny/update-profile')
  @MultiPart()
  Future<LoginResponseModel> updateParent({
    @Header('Authorization') required token,
    @Part() String? full_name,
    @Part() String? user_name,
    @Part() String? email,
    @Part() String? phone,
    @Part() String? dob,
    @Part() File? image,
    @Part() int? city_id,
    @Part() String? gender,
    @Part() String? lat,
    @Part() String? lng,
    @Part() String? address,
  });
  @POST('/verify-code')
  Future<LoginResponseModel> verifyCode(@Body() VerifyCodeModel verifyCodeModel);
  @POST('/check-email')
  Future<BasicResponseModel> checkEmail(@Body() CheckEmailModel checkEmailModel);
  @POST('/change-forget-password')
  Future<BasicResponseModel> changePassword(@Body() ChangePassword changePassword);

  @GET('/cities')
  Future<CitiesModel> getCities();

  @GET('/favorite')
  Future<FavouriteDto> getFavorite(@Header('Authorization') token);
  @POST('/favorite/add-remove')
  Future<AddFavouriteResponse> addRemoveFavourite(
      @Header('Authorization') token, @Body() AddFavoriteDto addFavoriteDto);

  @GET('/nanny/search')
  Future<SearchForNannyModel> searchForNanny(@Header('Authorization') token, @Queries() Map<String, dynamic> queries);
}
