import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:nanny_co/data/model/dto_model/update_profile/post_update_parent.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';

part 'update_parent_state.dart';

class UpdateParentCubit extends Cubit<UpdateParentState> {
  UpdateParentCubit() : super(UpdateParentInitial());

  static UpdateParentCubit get(BuildContext context)=> BlocProvider.of(context);

   TextEditingController fullName = TextEditingController();
   TextEditingController userName = TextEditingController();
   TextEditingController email= TextEditingController();
   TextEditingController phone= TextEditingController();
  TextEditingController dob= TextEditingController();
   File? image;
  TextEditingController cityId= TextEditingController();
   TextEditingController gender= TextEditingController();
   TextEditingController lat= TextEditingController();
   TextEditingController lng= TextEditingController();
   TextEditingController address= TextEditingController();
   
  PostUpdateParentModel postUpdateParentModel = PostUpdateParentModel();


  initialValue(){
    postUpdateParentModel.fullName = SettingsProvider.userData.fullName;
    postUpdateParentModel.userName = SettingsProvider.userData.userName;
    postUpdateParentModel.dob =  DateFormat('yyyy-mm-dd').format(SettingsProvider.userData.dob!);
    postUpdateParentModel.address = SettingsProvider.userData.address;
    postUpdateParentModel.gender = SettingsProvider.userData.gender;
    postUpdateParentModel.email = SettingsProvider.userData.email;
    emit(UpdateParentGetInitial());
  }


}
