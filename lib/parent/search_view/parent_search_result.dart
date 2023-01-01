import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';

import 'package:nanny_co/parent/search_view/parent_search_filter_view.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../parent_nanny_booking/Controller/parentBooking_Controller.dart';
import 'Controller/parentSearch_Controller.dart';
import 'package:get/get.dart';

class parent_search_result extends StatefulWidget {
  parent_search_result();

  @override
  State<parent_search_result> createState() => _parent_search_resultState();
}

class _parent_search_resultState extends State<parent_search_result> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  // parentSearch_Controller search_controller = Get.put(parentSearch_Controller());
  var selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // parentBooking_Controller booking_controller = Get.put(parentBooking_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const parent_search_filter_view(),
        body: SizedBox(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    parent_bottombar_viewState.selectedIndex = 0;
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (context) => const parent_bottombar_view()));
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    //scaffoldkey.currentState!.openEndDrawer();
                                    scaffoldkey.currentState!.showBottomSheet((context) => const parent_search_filter_view(),
                                        backgroundColor: Colors.transparent);
                                  },
                                  child: const Icon(
                                    Icons.filter_alt,
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
                                  'Search Result'.translate(),
                                  style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const Image(image: AssetImage('assets/images/dots.png')),
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
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: injector.get<SearchNannyCubit>().searchForNannyModel?.data!=null
                      ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data!.length < 2 ? '${injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data!.length} Nanny' : '${injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data!.length} Nannies'} ',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                                ),

                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.62,
                              child: NotificationListener<OverscrollIndicatorNotification>(
                                onNotification: (OverscrollIndicatorNotification overscroll) {
                                  overscroll.disallowGlow();
                                  return false;
                                },
                                child: ListView.builder(
                                    itemCount: injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data!.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async{
                                          // booking_controller.currentnanny = snapshot.data!.elementAt(index).obs;
                                          await injector.get<SearchNannyCubit>().getNannyDetails(injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data![index].id.toString());
                                          parent_bottombar_viewState.selectedIndex = 13;
                                          Navigator.of(context)
                                              .pushReplacement(MaterialPageRoute(builder: (context) => const parent_bottombar_view()));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
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
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data!.elementAt(index).nannyName}',
                                                    style: GoogleFonts.raleway(
                                                        color: Theme.of(context).primaryColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '1.5 KM',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
                                                  ),
                                                  const SizedBox(
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {

                                                    },
                                                    child: Icon(CupertinoIcons.heart,
                                                        size: 20, color: Theme.of(context).primaryColor),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${injector.get<SearchNannyCubit>().searchForNannyModel!.data!.data!.elementAt(index).price} Riyal',
                                                    style: GoogleFonts.raleway(
                                                        color: Theme.of(context).primaryColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Per Hour',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ))
                        ],
                      ))
                      : Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
