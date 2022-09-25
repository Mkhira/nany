import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/nanny_drawer.dart/nanny_drawer_view.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';

import '../nanny_notification_view/nanny_notifications_view.dart';

class nanny_addnew_wallet_view extends StatelessWidget{
  nanny_addnew_wallet_view();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: nanny_drawer_view(),
        body: Container(
            height: sh,
            width: sw,
            child: Stack(
                children: [
                  Container(
                      height: sh*0.35,
                      width: sw,
                      color: Theme.of(context).primaryColor,
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          },
                                        child: Icon(Icons.arrow_back,color: Colors.white,size: 20,)
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add New Account ',
                                      style: GoogleFonts.raleway(
                                          color:Colors.white,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 20
                                      ),
                                    ),
                                    Image(image:AssetImage('assets/images/dots.png')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: sh*0.81,
                      width: sw,
                      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      ),
                      child: SingleChildScrollView(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Registered Name',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Account Number',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Confirm Account Number',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                             Text(
                                'IRFC Code',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: ElevatedButton(onPressed: (){

                                },
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))
                                    ),
                                    child:Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Submit',
                                              style: GoogleFonts.raleway(
                                                  color:Colors.white,
                                                  fontSize: 20
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 10,),
                            ],
                          )
                      ),
                    ),
                  ),
                ]
            )));
  }
}
