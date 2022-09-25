import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';

import '../../nany/auth_view/Model/nannyDataModel.dart';
import '../auth_view/Controller/Auth_controller.dart';
import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../parent_drawer.dart/parent_drawer_view.dart';
import '../parent_nanny_booking/Controller/parentBooking_Controller.dart';
import '../search_view/Controller/parentSearch_Controller.dart';

class parent_favourite_nanny extends StatefulWidget {
  parent_favourite_nanny();

  @override
  State<parent_favourite_nanny> createState() => _parent_favourite_nannyState();
}

class _parent_favourite_nannyState extends State<parent_favourite_nanny> {
  parentSearch_Controller search_controller =
  Get.put(parentSearch_Controller());

  var selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  parentBooking_Controller booking_controller =
  Get.put(parentBooking_Controller());
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: parent_drawer_view(),
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
                                        parentFirebaseAuthController().signOut();
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    parent_signin_view()));
                                      },
                                      child: Icon(
                                        Icons.logout,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Favourite Nanny ',
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
                            child: Text(
                              '${search_controller.parentModel.value.favourite!=null?search_controller.parentModel.value.favourite?.length:0} Favourite Nannies',
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                              padding:
                              EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.62,
                              child: NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification:
                                    (OverscrollIndicatorNotification
                                overscroll) {
                                  overscroll.disallowGlow();
                                  return false;
                                },
                                child: ListView.builder(
                                    itemCount: search_controller.parentModel.value.favourite!=null?search_controller.parentModel.value.favourite!.length:0,
                                    itemBuilder: (context, index) {
                                      return StreamBuilder<nannyDataModel>(
                                        stream:search_controller.getFavNannies(search_controller.parentModel.value.favourite?.elementAt(index)),
                                        builder: (context, snapshot) {
                                          if(snapshot.hasData){
                                          return InkWell(
                                            onTap: () {
                                              booking_controller
                                                  .currentnanny =
                                                  snapshot.data!.obs;
                                              parent_bottombar_viewState
                                                  .selectedIndex = 13;
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          parent_bottombar_view()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 20,
                                                  left: 10,
                                                  right: 10),
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors
                                                        .grey.shade300,
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(
                                                    20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data!.fullname}',
                                                        style: GoogleFonts.raleway(
                                                            color: Theme.of(
                                                                context)
                                                                .primaryColor,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize: 18),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '1.5 KM',
                                                        style: GoogleFonts
                                                            .raleway(
                                                            color: Colors
                                                                .grey,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize:
                                                            12),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      RatingBar(
                                                        glow: false,
                                                        updateOnDrag: false,
                                                        initialRating: 4,
                                                        direction:
                                                        Axis.horizontal,
                                                        allowHalfRating:
                                                        true,
                                                        itemCount: 5,
                                                        itemSize: 20,
                                                        ratingWidget:
                                                        RatingWidget(
                                                          full: Icon(
                                                            Icons.star,
                                                            color: Colors
                                                                .orange
                                                                .shade800,
                                                          ),
                                                          half: Icon(
                                                            Icons.star,
                                                            color: Colors
                                                                .orange
                                                                .shade800,
                                                          ),
                                                          empty: Icon(
                                                            Icons
                                                                .star_border_outlined,
                                                            color: Colors
                                                                .orange
                                                                .shade800,
                                                          ),
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      StreamBuilder<DocumentSnapshot>(
                                                          stream:FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).get().asStream(),
                                                          builder: (context, snapshotData) {
                                                            if(snapshotData.hasData){
                                                              List<dynamic> favList=snapshotData.data?['favourite'];
                                                              if(!favList.contains('${snapshot.data!.id}')){
                                                                return InkWell(
                                                                  onTap:(){
                                                                    FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(
                                                                        {
                                                                          'favourite':FieldValue.arrayUnion([snapshot.data!.id])
                                                                        }).then((value) =>
                                                                    {
                                                                      setState((){
                                                                        print('added');
                                                                      })
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                      CupertinoIcons
                                                                          .heart,
                                                                      size: 20,
                                                                      color: Theme.of(
                                                                          context)
                                                                          .primaryColor),
                                                                );
                                                              }else{
                                                                return InkWell(
                                                                  onTap:(){
                                                                    FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(
                                                                        {
                                                                          'favourite':FieldValue.arrayRemove([snapshot.data!.id])
                                                                        }).then((value) =>
                                                                    {
                                                                      setState((){
                                                                        search_controller.parentModel.value.favourite!.remove(snapshot.data!.id);
                                                                        print('removed');
                                                                      })
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                      CupertinoIcons
                                                                          .heart_fill,
                                                                      size: 20,
                                                                      color: Theme.of(
                                                                          context)
                                                                          .primaryColor),
                                                                );
                                                              }
                                                            }else{
                                                              return InkWell(
                                                                onTap:(){
                                                                  FirebaseFirestore.instance.collection('parent').doc(FirebaseAuth.instance.currentUser!.uid).update(
                                                                      {
                                                                        'favourite':FieldValue.arrayUnion([snapshot.data!.id])
                                                                      }).then((value) => {
                                                                    setState((){
                                                                      print('removed');
                                                                    })
                                                                  });
                                                                },
                                                                child: Icon(
                                                                    CupertinoIcons
                                                                        .heart,
                                                                    size: 20,
                                                                    color: Theme.of(
                                                                        context)
                                                                        .primaryColor),
                                                              );
                                                            }}
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '${snapshot.data!.minRange} Riyal',
                                                        style: GoogleFonts.raleway(
                                                            color: Theme.of(
                                                                context)
                                                                .primaryColor,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize: 18),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Per Hour',
                                                        style: GoogleFonts
                                                            .raleway(
                                                            color: Colors
                                                                .grey,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize:
                                                            12),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );}else{return Container();}
                                        }
                                      );
                                    }),
                              ))
                        ],
                      )),
                    ),
                  ),
                ]))
        );
  }}
