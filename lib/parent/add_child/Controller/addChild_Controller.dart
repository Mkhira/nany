import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../auth_view/Model/parentDataModel.dart';

class parentChild_Controller extends GetxController{
  Rx<parentDataModel> parentModel=parentDataModel().obs;
  Future addChild(Map<String,dynamic> data)async{
    await FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(
        {
          'children': FieldValue.arrayUnion([data]),
        });
    return true;
  }
  Future removeChild(Map<String,dynamic> data)async{
    await FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(
        {
          'children': FieldValue.arrayRemove([data]),
        });
    return true;
  }
}