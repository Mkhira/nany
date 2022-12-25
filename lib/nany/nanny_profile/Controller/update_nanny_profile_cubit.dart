import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/business_layer/use_case/get_cities_use_case.dart';
import 'package:nanny_co/business_layer/use_case/nanny/nanny_details_usecase.dart';
import 'package:nanny_co/business_layer/use_case/nanny/post_appointment.dart';
import 'package:nanny_co/business_layer/use_case/update_use_case/sister_update_use_case.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/nany/nanny_details.dart';
import 'package:nanny_co/data/model/dto_model/nany/post_appointment_data.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_sister_profile_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/widget/alerts.dart';

part 'update_nanny_profile_state.dart';

class UpdateNannyProfileCubit extends Cubit<UpdateNannyProfileState> {
  UpdateNannyProfileCubit() : super(UpdateNannyProfileInitial());

  PostUpdateSisterProfileModel postUpdateSisterProfileModel = PostUpdateSisterProfileModel();

  initialValue() {
    postUpdateSisterProfileModel.fullName = SettingsProvider.userData.fullName;
    postUpdateSisterProfileModel.userName = SettingsProvider.userData.userName;
    postUpdateSisterProfileModel.userName = SettingsProvider.userData.userName;
    postUpdateSisterProfileModel.dob = DateFormat('yyyy-MM-dd').format( SettingsProvider.userData.dob!= null && SettingsProvider.userData.dob !=''? DateTime.parse(SettingsProvider.userData.dob!):DateTime.now());
    postUpdateSisterProfileModel.address = SettingsProvider.userData.address;
    postUpdateSisterProfileModel.gender = SettingsProvider.userData.gender;
    postUpdateSisterProfileModel.email = SettingsProvider.userData.email;
    postUpdateSisterProfileModel.phone = SettingsProvider.userData.phone;
    postUpdateSisterProfileModel.courseName= SettingsProvider.userData.courseName;
    postUpdateSisterProfileModel.universityName =SettingsProvider.userData.universityName;
    postUpdateSisterProfileModel.educationCity=SettingsProvider.userData.educationCity;
    postUpdateSisterProfileModel.totalExperience=SettingsProvider.userData.totalExperience;
    postUpdateSisterProfileModel.specialNeeds= SettingsProvider.userData.specialNeeds;
    postUpdateSisterProfileModel.idType = SettingsProvider.userData.idType;
    postUpdateSisterProfileModel.idNumber =SettingsProvider.userData.idNumber;
    postUpdateSisterProfileModel.minPrice =SettingsProvider.userData.minPrice;
    postUpdateSisterProfileModel.maxPrice=SettingsProvider.userData.maxPrice;
    postUpdateSisterProfileModel.lessonsType=SettingsProvider.userData.lessonsType;
    postUpdateSisterProfileModel.noOfChildren=SettingsProvider.userData.noOfChildren.toString();
    postUpdateSisterProfileModel.sitterType= SettingsProvider.userData.sitterType;
    emit(UpdateNannyProfileGetInitial());
  }

  getImage(File? file) {
    postUpdateSisterProfileModel.image = file;
  }

  final GetCitiesUseCase cityUseCase = injector.get<GetCitiesUseCase>();
  List<CityModel> cites = [];
  int? cityIdValue;
  int? cityIdEducationValue;
  String cityName = '';
  String cityEducationName = '';
  getCites() async {
    cites = await cityUseCase.execute(null);
    if (cites.isNotEmpty) {
      cityIdValue = cites.first.id;
      cityIdEducationValue = cites.first.id;
      cityName = cites.first.name;
    }
    emit(UpdateNannyProfileChange());
  }

  changeDropDownButton(int value) {
    cityIdValue = value;
    postUpdateSisterProfileModel.cityId = value;
    cityName = cites.firstWhere((element) => element.id == value).name;

    emit(UpdateNannyProfileChange());
  }
  changeDropDownButtonEducation(int value) {
    cityIdEducationValue = value;
    postUpdateSisterProfileModel.educationCity = value;
    cityEducationName = cites.firstWhere((element) => element.id == value).name;

    emit(UpdateNannyProfileChange());
  }


  Future<bool> updateNanny(BuildContext context) async {
    print(postUpdateSisterProfileModel.toString());
    try {
      LoginResponseModel loginResponseModel =
      await injector.get<SisterUpdateUseCase>().execute(postUpdateSisterProfileModel);

      if (loginResponseModel.status! == 200) {
        return true;
      } else {
        Alerts.showSnackBar(context: context, message: loginResponseModel.message ?? '');

        return false;
      }
    } catch (e) {
      print(e);
      Alerts.showSnackBar(context: context, message: 'Check Connection');

      return false;
    }
  }

  NannyDetails ? nannyDetails;

  getNannyDetails(String id)async{
    nannyDetails = await injector.get<NannyDetailsUseCase>().execute(id);
    emit(UpdateNannyProfileChange());

  }

  addAppointment(PostAppointment postAppointment)async{
   await injector.get<NannyPostAppointment>().execute(postAppointment);
   await getNannyDetails(SettingsProvider.userData.id.toString());
  }

}
