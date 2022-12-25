import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/business_layer/use_case/get_cities_use_case.dart';
import 'package:nanny_co/business_layer/use_case/update_use_case/update_parent_use_ase.dart';
import 'package:nanny_co/data/model/dto_model/cities_model.dart';
import 'package:nanny_co/data/model/dto_model/login_response_model.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_parent.dart';
import 'package:nanny_co/data/model/updae_parent_model.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/widget/alerts.dart';

part 'update_parent_state.dart';

class UpdateParentCubit extends Cubit<UpdateParentState> {
  UpdateParentCubit() : super(UpdateParentInitial());

  static UpdateParentCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  File? image;
  TextEditingController cityId = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController lng = TextEditingController();
  TextEditingController address = TextEditingController();

  PostUpdateParentModel postUpdateParentModel = PostUpdateParentModel();

  initialValue() {

    postUpdateParentModel.fullName = SettingsProvider.userData.fullName;
    postUpdateParentModel.userName = SettingsProvider.userData.userName;
    postUpdateParentModel.userName = SettingsProvider.userData.userName;
    postUpdateParentModel.dob = DateFormat('yyyy-MM-dd').format( SettingsProvider.userData.dob!= null && SettingsProvider.userData.dob !=""? DateTime.parse(SettingsProvider.userData.dob!):DateTime.now());
    postUpdateParentModel.address = SettingsProvider.userData.address;
    postUpdateParentModel.gender = SettingsProvider.userData.gender;
    postUpdateParentModel.email = SettingsProvider.userData.email;
    postUpdateParentModel.phone = SettingsProvider.userData.phone;
    emit(UpdateParentGetInitial());
  }

  final UpdateParentUseCase _updateParentUseCase = injector.get<UpdateParentUseCase>();

  Future<bool> updateParent(BuildContext context) async {
    print(postUpdateParentModel.toString());
    try {
      LoginResponseModel loginResponseModel =
          await _updateParentUseCase.execute(ParentUpdateModel(postUpdateParentModel: postUpdateParentModel, image: image));

      print(loginResponseModel.status!);
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

  getImage(File? file) {
    image = file;
    postUpdateParentModel.image = file;
  }

  final GetCitiesUseCase cityUseCase = injector.get<GetCitiesUseCase>();
  List<CityModel> cites = [];
  int? cityIdValue;
  String cityName = '';
  getCites() async {
    cites = await cityUseCase.execute(null);
    if (cites.isNotEmpty) {
      cityIdValue = cites.first.id;
      cityName = cites.first.name;
    }
    emit(UpdateParentGetInitial());
  }

  changeDropDownButton(int value) {
    cityIdValue = value;
    postUpdateParentModel.cityId = value;
    cityName = cites.firstWhere((element) => element.id == value).name;

    emit(UpdateParentGetInitial());
  }
}
