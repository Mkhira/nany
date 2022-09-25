import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Controller/parentBooking_Controller.dart';

import '../../../nany/auth_view/Model/nannyDataModel.dart';
import '../../auth_view/Model/parentDataModel.dart';

class parentBookingModel{

  parentBookingModel({ this.bookingId,this.PaymentMethod,this.nannyId,this.canceledbynanny,this.availability,this.status,this.sitting,this.children,this.city,this.price,this.distance,this.entryDate,this.entryTime,this.exitDate,this.exitTime,this.nannyImage,this.nannyName,this.parentId,this.parentImage,this.parentName,this.Type});
  Availability?availability;
  String ?nannyId;
  String? parentId;
  String? PaymentMethod='Cash';
  bool? status=true;
  bool? sitting=false;
  bool? canceledbynanny=false;
  String? price;
  String? city;
  String? distance;
  String? Type;
  List<Children>? children;
  String? entryTime;
  String? exitTime;
  String? entryDate;
  String? exitDate;
  String? parentName;
  String? nannyName;
  String? parentImage;
  String? nannyImage;
  String? bookingId;
  parentBookingModel.fromjson(DocumentSnapshot json){
    bookingId=json.id;
    nannyId=json['nannyId'];
    parentId=json['parentId'];
    availability=Availability.fromJson(json['availability']);
    PaymentMethod=json['paymentMethod'];
    status=json['status'];
    sitting=json['sittingStatus'];
    canceledbynanny=json['canceledByNanny'];
    parentName=json['parentName'];
    parentImage=json['parentImage'];
    nannyName=json['nannyName'];
    nannyImage=json['nannyImage'];
    exitTime=json['exitTime'];
    exitDate=json['exitDate'];
    entryTime=json['entryTime'];
    entryDate=json['entryDate'];
    distance=json['distance'];
    price=json['price'];
    city=json['city'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availability']=availability!.toJson();
    data['paymentMethod']=PaymentMethod;
    data['parentId']=FirebaseAuth.instance.currentUser!.uid;
    data['nannyId']=nannyId;
    data['sittingStatus']=sitting;
    data['status']=status;
    data['canceledByNanny']=false;
    data['parentName']=parentName;
    data['parentImage']=parentImage;
    data['nannyName']=nannyName;
    data['nannyImage']=nannyImage;
    data['exitTime']=exitTime;
    data['exitDate']=exitDate;
    data['entryTime']=entryTime;
    data['entryDate']=exitDate;
    data['distance']=distance;
    data['price']=price;
    data['city']=city;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}