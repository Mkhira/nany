import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/paypal.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/gallery_view/parent_gallery_view.dart';
import 'package:nanny_co/parent/parent_drawer.dart/parent_drawer_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Model/parentBookingModel.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_booking_confirmation_view.dart';

import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';

import '../../common/widget/ProgressPopUp.dart';
import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../parent_profile/Controller/parentProfile_Controller.dart';
import '../search_view/Controller/parentSearch_Controller.dart';
import 'package:get/get.dart';

import 'Controller/parentBooking_Controller.dart';

class parent_book_nany_view extends StatefulWidget {
  parent_book_nany_view();

  @override
  State<parent_book_nany_view> createState() => _parent_book_nany_viewState();
}

class _parent_book_nany_viewState extends State<parent_book_nany_view> {
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

  var check = true;
  var goto = false;
  var home = false;
  @override
  void initState() {
    booking_controller
        .availabilityIndex=1000000.obs;
    booking_controller.currentnanny?.value
.type == 'Goto Sitter'
        ? goto = true
        : home = true;
    // TODO: implement initState
    super.initState();
  }

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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    parent_bottombar_viewState.selectedIndex =
                                        13;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                parent_bottombar_view()));
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Booking Nanny ',
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
                            Obx(() => Text(
                                  '${search_controller.startdate}',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            Obx(() => Text(
                                  '${search_controller.start} - ${search_controller.end} ${profile_controller.parentModel.value.address?.city}',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
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
                                  '${booking_controller.currentnanny?.value
.image}')),
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
                                        '${booking_controller.currentnanny?.value
.fullname}',
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
                                        '${booking_controller.currentnanny?.value
.minRange} Riyal',
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Entry Time',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 20,
                                          bottom: 10,
                                          top: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.clock_fill,
                                            color: Colors.grey.shade400,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(() => Text(
                                                    '${search_controller.start.value}',
                                                    style: GoogleFonts.raleway(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Obx(() => Text(
                                                    '${search_controller.startdate.value}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade400,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Exit Time',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 20,
                                          bottom: 10,
                                          top: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.clock_fill,
                                            color: Colors.grey.shade400,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(() => Text(
                                                    '${search_controller.end.value}',
                                                    style: GoogleFonts.raleway(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Obx(() => Text(
                                                    '${search_controller.enddate.value}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade400,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Availability',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      booking_controller.currentnanny?.value
.availability != null
                          ? Container(
                              height: 150,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                  itemCount: booking_controller
                                     .currentnanny!.value.availability!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    if(booking_controller
                                        .currentnanny!.value.availability!.elementAt(index).booked==false) {
                                      return Stack(
                                        children: [
                                          Container(
                                              width: 150,
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20))),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${booking_controller.currentnanny?.value.availability!.elementAt(index).date}           ',
                                                            style: GoogleFonts.raleway(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            'Selected time    ',
                                                            style: GoogleFonts
                                                                .raleway(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500,
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20))),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '${booking_controller.currentnanny?.value.availability!.elementAt(index).startTime}    ',
                                                                style: GoogleFonts.raleway(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_sharp,
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '${booking_controller.currentnanny?.value.availability!.elementAt(index).startTime}    ',
                                                                style: GoogleFonts.raleway(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_sharp,
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          Positioned(
                                              right: 0,
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: Column(
                                                  children: [
                                                    Visibility(
                                                      visible: booking_controller
                                                              .availabilityIndex
                                                              ?.value ==
                                                          index,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            booking_controller
                                                                    .availabilityIndex =
                                                                0.obs;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color: Colors
                                                              .green.shade600,
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: booking_controller
                                                              .availabilityIndex
                                                              ?.value !=
                                                          index,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            booking_controller
                                                                    .availabilityIndex =
                                                                index.obs;
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.circle_outlined,
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                        ],
                                      );
                                    } else{
                                      return index==0? Container(
                                        width: sw,
                                          child:Center(child:Text('${index==0?'Not Available':''}'))): Container();
                                    }
                                  }),
                            )
                          : Container(

                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Sitter Type',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: goto,
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            goto=value!;
                                            home=!value;
                                          });
                                        }),
                                    Text(
                                      'Go to Sitter',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        value: home,
                                        onChanged: (value) {
                                          setState(() {
                                            home=value!;
                                            goto=!value;
                                          });
                                        }),
                                    Text(
                                      'Home Sitter',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: sw,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Booking "Nanny ${booking_controller.currentnanny?.value
.fullname}"',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    booking_controller.availabilityIndex!=1000000?Obx(() => Text(
                                              '${booking_controller.currentnanny?.value
.availability!.elementAt(booking_controller.availabilityIndex!.value).startTime} - ${booking_controller.currentnanny?.value
.availability!.elementAt(booking_controller.availabilityIndex!.value).startTime}',
                                              style: GoogleFonts.raleway(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ))
                                        : Container(),
                                    SizedBox(
                                      height: 05,
                                    ),
                                    booking_controller.availabilityIndex!=1000000
                                        ? Obx(() => Text(
                                              '${booking_controller.availabilityIndex==1000000?'None':booking_controller.currentnanny?.value
.availability?.elementAt(booking_controller.availabilityIndex!.value).date} from',
                                              style: GoogleFonts.raleway(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                        : Container(),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      '${booking_controller.currentnanny?.value
.minRange} Riyal',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                hintText: 'Card No',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: sw,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintStyle: GoogleFonts.raleway(
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                      hintText: 'MM/YY',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                    ),
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintStyle: GoogleFonts.raleway(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                        hintText: 'CVV',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    // parent_bottombar_viewState.selectedIndex =
                                    //     7;
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaypalPayment( onFinish: (number) async {
                                        // payment done
                                        print('order id: ' + number);
                                        },)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.credit_card,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            ' Pay & Finish ',
                                            style: GoogleFonts.raleway(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Or choose the option pay in cash',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    parentBookingModel bookingModel=new parentBookingModel();

                                    print(booking_controller.currentnanny!.value.id);
                                    if(booking_controller.availabilityIndex!=1000000){
                                      ProgressPopup(context);
                                      bookingModel.nannyId=booking_controller.currentnanny!.value.id;
                                      bookingModel.PaymentMethod='Cash';
                                      bookingModel.sitting=false;
                                      bookingModel.sitting=false;
                                      bookingModel.status=true;
                                      bookingModel.availability=booking_controller
                                        .currentnanny!.value.availability!.elementAt(booking_controller.availabilityIndex!.value);
                                      bookingModel.city=search_controller.parentModel.value.address?.city;
                                      bookingModel.price=booking_controller.currentnanny!.value.minRange.toString();
                                      bookingModel.distance='1.7km';
                                      bookingModel.parentImage=search_controller.parentModel.value.image;
                                      bookingModel.nannyImage=booking_controller.currentnanny!.value.image;
                                      bookingModel.canceledbynanny=false;
                                      bookingModel.Type=goto==true?'Goto Sitter':'Home Sitter';
                                      bookingModel.parentName=search_controller.parentModel.value.fullname;
                                      bookingModel.nannyName=booking_controller.currentnanny!.value.fullname;
                                      bookingModel.children=search_controller.parentModel.value.children;
                                    booking_controller.addBooking(
                                     bookingModel
                                    ).then((value) => {
                                      if(value!=false){
                                       bookingId=value,
                                        parent_bottombar_viewState.selectedIndex =
                                        7,
                                        Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                parent_bottombar_view())),
                                      }else{
                                        Navigator.pop(context),
                                    AnimatedSnackBar.material(
                                    'Booking Failed please try again',
                                    type: AnimatedSnackBarType.error,
                                    ).show(context)
                                      }
                                    });}else{ AnimatedSnackBar.material(
                                    'Please select availability',
                                    type: AnimatedSnackBarType.error,
                                    ).show(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                          side: BorderSide(
                                              width: 5,
                                              color: Theme.of(context)
                                                  .primaryColor))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.moneyBill1Wave,
                                            size: 25,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          Text(
                                            '  Pay in Cash ',
                                            style: GoogleFonts.raleway(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ])));
  }
}
