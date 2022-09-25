import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../auth_view/Model/parentDataModel.dart';

class parentProfile_Controller extends GetxController{
  Rx<parentDataModel> parentModel=parentDataModel().obs;
  getProfileData(){
    FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      parentModel.value=parentDataModel.fromJson(value.data()!);
    });
  }
  Future UpdateProfile(Map<String,dynamic> data)async{
    await FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(data);
    return true;
  }
}