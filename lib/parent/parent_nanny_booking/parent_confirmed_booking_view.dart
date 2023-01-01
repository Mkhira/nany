import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/gallery_view/parent_gallery_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_drawer.dart/parent_drawer_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_sitting_started_view.dart';

import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../parent_profile/Controller/parentProfile_Controller.dart';
import '../search_view/Controller/parentSearch_Controller.dart';
import 'package:get/get.dart';

import 'Controller/parentBooking_Controller.dart';
import 'Model/parentBookingModel.dart';

class parent_booking_confirmed_view extends StatefulWidget {
  parent_booking_confirmed_view();

  @override
  State<parent_booking_confirmed_view> createState() =>
      _parent_booking_confirmed_viewState();
}

class _parent_booking_confirmed_viewState
    extends State<parent_booking_confirmed_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  List images = [
    'https://images.pexels.com/photos/1556691/pexels-photo-1556691.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.ctfassets.net/hrltx12pl8hq/5GaLeZJlLyOiQC4gOA0qUM/a0398c237e9744ade8b072f99349e07a/shutterstock_152461202_thumb.jpg?fit=fill&w=480&h=270'
  ];
  parentBooking_Controller booking_controller =
  Get.put(parentBooking_Controller());

  parentSearch_Controller search_controller =
  Get.put(parentSearch_Controller());

  parentProfile_Controller profile_controller =
  Get.put(parentProfile_Controller());
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  var check = true;
  bool canceled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(bookingId);
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    parent_bottombar_viewState.selectedIndex=7;
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Booking Confirm ',
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
                child: StreamBuilder<parentBookingModel>(
                  stream:booking_controller.GetBookingDetails(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                    return Container(
                      height: sh * 0.7,
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
                                  'Visit Schedule',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Entry Time',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          '${snapshot.data?.availability?.startTime}',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Exit Time'.translate(),
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          '${snapshot.data?.availability?.endTime}',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 1,
                                    ),
                                    child: RangeSlider(
                                      values: _currentRangeValues,
                                      max: 100,
                                      divisions: 5,
                                      activeColor: Colors.grey.shade400,
                                      inactiveColor: Colors.grey.shade200,
                                      labels: RangeLabels(
                                        _currentRangeValues.start
                                            .round()
                                            .toString(),
                                        _currentRangeValues.end.round().toString(),
                                      ),
                                      onChanged: (RangeValues values) {
                                        _currentRangeValues = values;
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            width: sw,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      '${snapshot.data?.nannyImage}')),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 1,
                                    blurRadius: 5)
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: sw,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Row(
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
                                            '${snapshot.data?.nannyName}',
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
                                            '1.5 KM',
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          RatingBar(
                                            glow: false,
                                            updateOnDrag: false,
                                            initialRating: 4,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 20,
                                            ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star,
                                                color: Colors.orange.shade800,
                                              ),
                                              half: Icon(
                                                Icons.star,
                                                color: Colors.orange.shade800,
                                              ),
                                              empty: Icon(
                                                Icons.star_border_outlined,
                                                color: Colors.orange.shade800,
                                              ),
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${snapshot.data?.price} Riyal',
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
                                            'Per Hour',
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ).asGlass(
                                    blurX: 20,
                                    blurY: 20,
                                    tintColor: Colors.white,
                                    clipBorderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Children\'s Detail',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 150,
                                  child: ListView.builder(
                                      itemCount: snapshot.data?.children !=
                                          null
                                          ? snapshot.data?.children?.length
                                          : 0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                          const EdgeInsets.only(right: 8.0),
                                          child: Row(
                                            children: [
                                              Visibility(
                                                visible: index <=
                                                    snapshot.data!.children!.length,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey.shade300,
                                                                spreadRadius: 3,
                                                                blurRadius: 5)
                                                          ]),
                                                      child: Container(
                                                        height: 70,
                                                        width: 70,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image: NetworkImage(
                                                                    '${snapshot.data?.children!.elementAt(index).image}'))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                   Text(
                                                      '${snapshot.data?.children!.elementAt(index).name}',
                                                      style:
                                                      GoogleFonts.raleway(
                                                          color: Theme.of(
                                                              context)
                                                              .primaryColor,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 14),
                                                    ),
                                                     Text(
                                                      '${snapshot.data?.children!.elementAt(index).gender}',
                                                      style:
                                                      GoogleFonts.raleway(
                                                          color: Colors
                                                              .redAccent,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Talk to Nanny',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        width: sw * 0.43,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(100),
                                                bottomLeft: Radius.circular(100)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey.shade400)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              CupertinoIcons.chat_bubble_2_fill,
                                              color: Theme.of(context).primaryColor,
                                              size: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        width: sw * 0.45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                                bottomRight: Radius.circular(100)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey.shade400)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              CupertinoIcons.device_phone_portrait,
                                              color: Theme.of(context).primaryColor,
                                              size: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Visibility(
                                  visible: !snapshot.hasData?false:snapshot.data!.canceledbynanny!,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              parent_bottombar_viewState.selectedIndex=9;
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(1000),
                                                    side: BorderSide(
                                                        color: Colors.red,
                                                        width: 5))),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20.0, horizontal: 10),
                                              child: Center(
                                                child: Text(
                                                  'Booking has been canceled by Nanny',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible:!snapshot.hasData?false: snapshot.data!.status!&& snapshot.data!.sitting!,
                                  child:                                 Row(
                                  children: [
                                    Text(
                                      'Status  ',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 16
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(height: 1,color: Colors.grey,),
                                    ),
                                    Text(
                                      '  Sitting started',
                                      style: GoogleFonts.raleway(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                                Visibility(
                                  visible:!snapshot.hasData?false: snapshot.data!.status! && !snapshot.data!.sitting!,
                                  child: Container(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                    child: Container(
                                                  height: 174,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          height: 23,
                                                        ),
                                                        Text(
                                                          "Are you sure?",
                                                          style: GoogleFonts.raleway(
                                                              fontSize: 15,
                                                              color: Theme.of(context).primaryColor,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "You wantto cancel the visit on",
                                                          style: GoogleFonts.raleway(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500),
                                                        ),
                                                        Text(
                                                          "${snapshot.data?.availability?.date}(${snapshot.data?.availability?.startTime} - ${snapshot.data?.availability?.date}(${snapshot.data?.availability?.endTime}?",
                                                          style: GoogleFonts.raleway(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Container(
                                                          height: 1,
                                                          width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width,
                                                          color: Colors.grey,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap:(){
                                                                    booking_controller.cancelBooking(bookingId: bookingId,canceledByNanny:false);
                                                                    setState(() {
                                                                      canceled=true;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Center(
                                                                      child: Text(
                                                                    "✔ yes",
                                                                    style: GoogleFonts
                                                                        .raleway(
                                                                            color: Colors
                                                                                .green,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                  )),
                                                                )
                                                              ],
                                                            )),
                                                            Container(
                                                              height: 60,
                                                              width: 1,
                                                              color: Colors.grey,
                                                            ),
                                                            Expanded(
                                                                child: InkWell(
                                                                  onTap: (){
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Row(
                                                              mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                              crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                              children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Colors.red,
                                                                    size: 20,
                                                                  ),
                                                                  Text(
                                                                    "No",
                                                                    style: GoogleFonts
                                                                        .raleway(
                                                                            color: Colors
                                                                                .red,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold),
                                                                  )
                                                              ],
                                                            ),
                                                                )),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                              });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                side: BorderSide(
                                                    color: Colors.red, width: 5))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 10),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  ' Cancel Booking',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.red,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    );
                  }else{
                      return Container(
                        height: sh * 0.7,
                        width: sw,
                        child: Center(child: Container(height: 30,width: 30,child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),),),
                      );
                    }}
                ),
              ),
            ])));
  }
}
