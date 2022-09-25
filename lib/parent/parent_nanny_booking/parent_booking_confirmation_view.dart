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
import 'package:nanny_co/parent/parent_nanny_booking/parent_confirmed_booking_view.dart';

import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../parent_profile/Controller/parentProfile_Controller.dart';
import '../search_view/Controller/parentSearch_Controller.dart';
import 'package:get/get.dart';

import 'Controller/parentBooking_Controller.dart';

class parent_booking_confirmation_view extends StatelessWidget {
  parent_booking_confirmation_view();
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
                                        5;
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
'${booking_controller.currentnanny?.value
    .availability!.elementAt(booking_controller.availabilityIndex!.value).startTime} - ${booking_controller.currentnanny?.value
    .availability!.elementAt(booking_controller.availabilityIndex!.value).startTime}',
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '''Your Booking has been confirmed 
for ${booking_controller.currentnanny?.value
.availability!.elementAt(booking_controller.availabilityIndex!.value).date} from
${booking_controller.currentnanny?.value
.availability!.elementAt(booking_controller.availabilityIndex!.value).startTime} - ${booking_controller.currentnanny?.value
.availability!.elementAt(booking_controller.availabilityIndex!.value).startTime}''',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  maxLines: 10,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/images/continue.png'))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    parent_bottombar_viewState.selectedIndex =
                                        8;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                parent_bottombar_view()));
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
                                          Text(
                                            ' Continue',
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
