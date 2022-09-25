import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/nanny_notification_view/nanny_notifications_view.dart';
import 'package:nanny_co/nany/nanny_wallet_view/nanny_addnew_wallet.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';
import '../../parent/parent_drawer.dart/parent_drawer_view.dart';
import '../nanny_drawer.dart/nanny_drawer_view.dart';
class nanny_wallet_view extends StatelessWidget {
  nanny_wallet_view();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
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
                                  'Wallet ',
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
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.purple.shade800,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Earnings',
                                        style: GoogleFonts.raleway(
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '12000 Riyal',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Withdraw Request',
                                        style: GoogleFonts.raleway(
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                      Icon(Icons.arrow_downward_sharp,size: 15,color: Colors.white,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:  Text(
                            'Save Account',
                            style: GoogleFonts.raleway(
                                color:Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Shieannee Bennet ',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '530-xxxx-2021',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.delete_forever,size: 30,color: Colors.red,)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>nanny_addnew_wallet_view()));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.add,size: 20,color: Colors.blue.shade700,),
                                      Text(
                                      ' Add new account',
                                      style: GoogleFonts.raleway(
                                          color:Colors.blue.shade700,
                                          fontSize: 14),
                          ),
                                    ],
                                  ),
                                ),
                              ],
                            ),),
                          SizedBox(height: 10,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:  Text(
                            'View Transaction History',
                            style: GoogleFonts.raleway(
                                color:Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),),
                          Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.642,
                              child:NotificationListener<OverscrollIndicatorNotification>(
                                onNotification: (OverscrollIndicatorNotification overscroll) {
                                  overscroll.disallowGlow();
                                  return false;
                                },
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return  Container(
                                        padding: EdgeInsets.all(20),
                                        margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Booking Id:NDNFSD12SA',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.grey.shade800,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '15 Sept,2021',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Booking Id:NDNFSD12SA',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.grey.shade800,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.add,size: 20,color: Colors.green,),
                                                    Text(
                                                      '500',
                                                      style: GoogleFonts.raleway(
                                                          color: Colors.green,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'Riyal',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.grey.shade500,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ))
                        ],
                      )),
                ),
              ),
            ])));
  }
}
