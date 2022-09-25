import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';

class nannyProfile_Controller extends GetxController{
  Rx<nannyDataModel> nannyModel=nannyDataModel().obs;
  getProfileData(){
    FirebaseFirestore.instance.collection('nanny').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      nannyModel.value=nannyDataModel.fromJson(value.data()!);
    });
  }
  Future UpdateProfile(Map<String,dynamic> data)async{
   await FirebaseFirestore.instance.collection('nanny').doc(FirebaseAuth.instance.currentUser!.uid).update(data);
   return true;
  }
}