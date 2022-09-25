import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../nany/auth_view/Model/nannyDataModel.dart';
import '../../auth_view/Model/parentDataModel.dart';

class parentSearch_Controller extends GetxController{
  Rx<parentDataModel> parentModel=parentDataModel().obs;
  TextEditingController search=new TextEditingController();
  var start='${DateFormat('hh:mm a').format(DateTime.now())}'.obs;
  var end='${DateFormat('hh:mm a').format(DateTime.now())}'.obs;
  var startdate='${DateFormat('MMM,dd,yyyy').format(DateTime.now())}'.obs;
  var enddate='${DateFormat('MMM,dd,yyyy').format(DateTime.now())}'.obs;
  var special=false.obs;
  var home=true.obs;
  var go=true.obs;
  var minPrice=0.0.obs;
  var maxPrice=100000000.0.obs;
  var mindist=0.0.obs;
  var maxdist=1000.0.obs;
  var ratting=5.0.obs;
  getProfileData(){
    print(FirebaseAuth.instance.currentUser!.uid);
    FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      parentModel.value=parentDataModel.fromJson(value.data()!);
    });
  }
 Stream<List<nannyDataModel>> getSearchResults()async*{
    print(FirebaseAuth.instance.currentUser!.uid);
    var data =await FirebaseFirestore.instance.collection('nanny').get();
    List<nannyDataModel> result=[];
    data.docs.forEach((element) {
       result.add(nannyDataModel.fromJson(element.data()));
    });

    yield result;
  }
  Stream<nannyDataModel> getFavNannies(element)async*{

       var data=await FirebaseFirestore.instance.collection('nanny').doc(element).get();

    yield nannyDataModel.fromJson(data.data()!);
  }
  Future UpdateProfile(Map<String,dynamic> data)async{
    await FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(data);
    return true;
  }
}