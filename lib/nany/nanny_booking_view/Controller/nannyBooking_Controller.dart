import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Model/parentBookingModel.dart';
String nannyBookingId='';
class nannyBooking_Controller extends GetxController{
  Stream<List<parentBookingModel>> GetAllUpComingBookings()async*{
    List<parentBookingModel> model=[];
    try{
      await FirebaseFirestore.instance.collection('Bookings').where('nannyId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((value) =>
      {
        value.docs.forEach((element) {
          if(element['status']==true) {
            model.add(parentBookingModel.fromjson(element));
          }})
      });}catch(ex){
      print(ex);
    }
    yield model;
  }
  Stream<List<parentBookingModel>> GetAllBookings()async*{
    List<parentBookingModel> model=[];
    try{
      await FirebaseFirestore.instance.collection('Bookings').where('nannyId',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((value) =>
      {
        value.docs.forEach((element) {
          model.add(parentBookingModel.fromjson(element));
        })
      });}catch(ex){
      print(ex);
    }
    yield model;
  }
  StreamController<parentBookingModel> Controller=StreamController<parentBookingModel>.broadcast();
  Stream<parentBookingModel> GetBookingDetails(){
    FirebaseFirestore.instance.collection('Bookings').doc(nannyBookingId).snapshots().listen((messageEvent) {
      if(messageEvent.data()!=null){
        Controller.add(parentBookingModel.fromjson(messageEvent));
      }
    });
    return Controller.stream;
  }
  cancelBooking(){
    print('cancel');
    FirebaseFirestore.instance.collection('Bookings').doc(nannyBookingId).update({
      'status':false,
      'canceledByNanny':true
    });
  }
  startSitting(){
    print('aya');
    FirebaseFirestore.instance.collection('Bookings').doc(nannyBookingId).update({
      'sittingStatus':true
    });
  }
}
