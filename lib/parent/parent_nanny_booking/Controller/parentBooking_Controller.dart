import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';

import '../../auth_view/Model/parentDataModel.dart';
import '../Model/parentBookingModel.dart';

String bookingId='';
class parentBooking_Controller extends GetxController{
  Rx<nannyDataModel> ?currentnanny=nannyDataModel().obs;
  Rx<parentDataModel> ?parent=parentDataModel().obs;
  Rx<int> ?availabilityIndex=0.obs;
  Rx<Availability>? availability;
  StreamController<parentBookingModel> Controller=StreamController<parentBookingModel>.broadcast();
  Stream<parentBookingModel> GetBookingDetails(){
   FirebaseFirestore.instance.collection('Bookings').doc(bookingId).snapshots().listen((messageEvent) {
      if(messageEvent.data()!=null){
      Controller.add(parentBookingModel.fromjson(messageEvent));
    }
    });
    return Controller.stream;
  }
  Future<List<parentBookingModel>> GetAllBookings()async{
    List<parentBookingModel> model=[];
    try{
    await FirebaseFirestore.instance.collection('Bookings').where('parentId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((value) =>
    {
      value.docs.forEach((element) {
        model.add(parentBookingModel.fromjson(element));
      })
    });}catch(ex){
      print(ex);
    }
    return model;
  }
  Future addBooking(parentBookingModel? model)async{
    var bookingId;
    try{
      await FirebaseFirestore.instance.collection('Bookings').add(model!.toJson()).then((value) =>
      {
        FirebaseFirestore.instance.collection('Bookings').doc(value.id).update({
          'bookingId':value.id
        }),
        FirebaseFirestore.instance.collection('nanny').doc(model.nannyId).update({
          'availability':FieldValue.arrayRemove([model.availability!.toJson()])
        }),
        model.availability!.booked=true,
        FirebaseFirestore.instance.collection('nanny').doc(model.nannyId).update({
          'availability':FieldValue.arrayUnion([model.availability!.toJson()])
        }),
        bookingId=value.id
      });
      return bookingId;
    }catch(ex){
      return false;
    }
  }
  cancelBooking({bookingId,canceledByNanny}){
    FirebaseFirestore.instance.collection('Bookings').doc(bookingId).update({
      'status':false,
      'canceledByNanny':canceledByNanny
    });
  }
}
