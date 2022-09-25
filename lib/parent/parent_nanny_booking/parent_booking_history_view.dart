import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Controller/parentBooking_Controller.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Model/parentBookingModel.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';

import '../parent_drawer.dart/parent_drawer_view.dart';

class parent_booking_history_view extends StatelessWidget {
  parent_booking_history_view();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  parentBooking_Controller controller=new parentBooking_Controller();
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
                                    scaffoldkey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
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
                                  'Booking History ',
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
                  height: sh * 0.69,
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
                              'Booking History',
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.642,
                              child:StreamBuilder<List<parentBookingModel>>(
                                stream:controller.GetAllBookings().asStream(),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData){
                                  return NotificationListener<OverscrollIndicatorNotification>(
                                    onNotification: (OverscrollIndicatorNotification overscroll) {
                                      overscroll.disallowGlow();
                                      return false;
                                    },
                                    child: ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: (){
                                              bookingId=snapshot.data!.elementAt(index).bookingId!.toString();
                                              parent_bottombar_viewState.selectedIndex=8;
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
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
                                                                  '${snapshot.data?.elementAt(index).nannyName}',
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [Text(
                                                      'Rate ${snapshot.data?.elementAt(index).nannyName}',
                                                      style: GoogleFonts.raleway(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16),
                                                    ),  RatingBar(
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
                                                    )],),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                }
                                else{
                                  return Container();
                                  }
                                }
                              ))
                        ],
                      )),
                ),
              ),
            ])));
  }
}
