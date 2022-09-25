import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/auth_view/Controller/Auth_controller.dart';
import 'package:nanny_co/nany/nanny_booking_view/Controller/nannyBooking_Controller.dart';
import 'package:nanny_co/nany/nanny_booking_view/nanny_booking_detail_view.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Model/parentBookingModel.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';

import '../../parent/parent_drawer.dart/parent_drawer_view.dart';
import '../nanny_drawer.dart/nanny_drawer_view.dart';
import '../nanny_notification_view/nanny_notifications_view.dart';

class nanny_home_view extends StatelessWidget {
  nanny_home_view();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  nannyBooking_Controller booking_controller=Get.put(nannyBooking_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: nanny_drawer_view(),
        body: Container(
            height: sh,
            width: sw,
            child: Stack(children: [
              Container(
                  height: sh * 0.35,
                  width: sw,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    scaffoldkey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>nanny_notifications_view()));
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          FontAwesomeIcons.solidBell,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            color:Colors.purple.shade400,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text('11',
                                              style: TextStyle(color: Colors.white,fontSize:8),),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Upcoming Booking ',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Image(
                                    image:
                                    AssetImage('assets/images/dots.png')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: sh * 0.71,
                  width: sw,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upcoming Bookings',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                            Text(
                              '${DateFormat('HH MMM,yyyy').format(DateTime.now())}',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),)
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.642,
                              child:NotificationListener<OverscrollIndicatorNotification>(
                                onNotification: (OverscrollIndicatorNotification overscroll) {
                                  overscroll.disallowGlow();
                                  return false;
                                },
                                child: StreamBuilder<List<parentBookingModel>>(
                                  stream: booking_controller.GetAllUpComingBookings(),
                                  builder: (context, snapshot) {
                                    if(snapshot.connectionState==ConnectionState.done){
                                    return ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: (
                                            ){
                                              nannyBookingId=snapshot.data!.elementAt(index).bookingId!.toString();
                                              nanny_bottombar_viewState.selectedIndex=5;
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>nanny_bottombar_view()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 20, left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.purple.shade700,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade300,
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(20),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${snapshot.data?.elementAt(index).parentName}',
                                                                  style: GoogleFonts.raleway(
                                                                      color:
                                                                      Colors.black,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 18),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '${snapshot.data?.elementAt(index).availability?.startTime} - ${snapshot.data?.elementAt(index).availability?.endTime}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.grey.shade800,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 12),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '${snapshot.data?.elementAt(index).city} (1.5 KM)',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.grey.shade800,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 12),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  '${snapshot.data?.elementAt(index).price} Riyal',
                                                                  style: GoogleFonts.raleway(
                                                                      color:
                                                                      Theme.of(context).primaryColor,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 18),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  'Per Hour\n',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.grey.shade800,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 12),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Type:${snapshot.data?.elementAt(index).Type}',
                                                            style: GoogleFonts.raleway(
                                                                color:
                                                                Colors.red,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12),
                                                          ),
                                                          Text(
                                                            'Payment Mode:${snapshot.data?.elementAt(index).PaymentMethod}',
                                                            style: GoogleFonts.raleway(
                                                                color:
                                                                Colors.green,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12),
                                                          ),

                                                        ],
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  'Entry Time',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontSize: 12),
                                                                ), Text(
                                                                  '${snapshot.data?.elementAt(index).availability?.startTime} (${snapshot.data?.elementAt(index).availability?.date})',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 10),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                Text(
                                                                  'Exit Time',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontSize: 12),
                                                                ), Text(
                                                                  '${snapshot.data?.elementAt(index).availability?.endTime} (${snapshot.data?.elementAt(index).availability?.date})',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 10),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.grey,width: 1),
                                                                shape: BoxShape.circle
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(height: 1,color: Colors.grey,),
                                                            ),
                                                            Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(color: Colors.grey,width: 1),
                                                                  shape: BoxShape.circle
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Child Info',
                                                              style: GoogleFonts.raleway(
                                                                  color:
                                                                  Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 16),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Container(
                                                          height: 70,
                                                          child: snapshot.data?.elementAt(index).children!=null?ListView.builder(
                                                              itemCount: snapshot.data?.elementAt(index).children?.length,
                                                              scrollDirection: Axis.horizontal,
                                                              padding: EdgeInsets.all(5),
                                                              itemBuilder: (context,index2){
                                                                return Container(
                                                                  height: 50,
                                                                  margin: EdgeInsets.only(right: 10),
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            padding: EdgeInsets.all(5),
                                                                            decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                                color: Colors.white,  boxShadow: [
                                                                              BoxShadow(
                                                                                  color: Colors.grey.shade300,
                                                                                  spreadRadius: 3,
                                                                                  blurRadius: 5
                                                                              )
                                                                            ]
                                                                            ),
                                                                            child: Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                  image: DecorationImage(
                                                                                      fit: BoxFit.fill,
                                                                                      image: NetworkImage(
                                                                                          '${snapshot.data?.elementAt(index).children?.elementAt(index2).image}'
                                                                                      )
                                                                                  )
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(width: 5,),
                                                                          Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                '${snapshot.data?.elementAt(index).children?.elementAt(index2).name}',
                                                                                style: GoogleFonts.raleway(
                                                                                    color: Theme.of(context).primaryColor,
                                                                                    fontWeight: FontWeight.bold ,
                                                                                    fontSize: 14
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '${snapshot.data?.elementAt(index).children?.elementAt(index2).gender}',
                                                                                style: GoogleFonts.raleway(
                                                                                    color:Colors.redAccent,
                                                                                    fontSize: 12
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }):Center(child: Text('Not Available',style: TextStyle(color: Colors.grey.shade500),),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                  else{
                                    return Center(child:CircularProgressIndicator(color:Theme.of(context).primaryColor));
                                    }
                                  }
                                ),
                              ))
                        ],
                      )),
                ),
              ),
            ])));
  }
}
