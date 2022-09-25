import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/Controller/Auth_controller.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Controller/parentBooking_Controller.dart';

import '../parent_drawer.dart/parent_drawer_view.dart';
import 'package:get/get.dart';
class parent_gallery_view extends StatelessWidget {
  parent_gallery_view();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  List images=[
    'https://images.pexels.com/photos/1556691/pexels-photo-1556691.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
 'https://images.ctfassets.net/hrltx12pl8hq/5GaLeZJlLyOiQC4gOA0qUM/a0398c237e9744ade8b072f99349e07a/shutterstock_152461202_thumb.jpg?fit=fill&w=480&h=270' ];
  parentBooking_Controller booking_controller =
  Get.put(parentBooking_Controller());
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
                                  'Gallery ',
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
                              'Gallery',
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                            height: sh,
                              width: sw,
                              child:Obx(()=> booking_controller.currentnanny!.value.gallery!=null?GridView.builder(
                                itemCount: booking_controller.currentnanny!.value.gallery?.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                itemBuilder: (BuildContext context, int index){
                                  return InkWell(
                                    onTap: (){
                                      final imageProvider = Image.network("${booking_controller.currentnanny!.value.gallery?.elementAt(index)}").image;
                                      showImageViewer(context, imageProvider, onViewerDismissed: () {
                                        print("dismissed");
                                      });
                                    },
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow:[ BoxShadow(
                                            color: Colors.grey.shade400,
                                            spreadRadius: 2,
                                            blurRadius: 10
                                          )],
                                          image: DecorationImage(fit: BoxFit.fill,image: NetworkImage(booking_controller.currentnanny!.value.gallery?.elementAt(index)))
                                        ),
                                        ),
                                  );
                                },
                              )
                          :Container())),
                        ],
                      )),
                ),
              ),
            ])));
  }
}
