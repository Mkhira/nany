import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/Controller/Auth_controller.dart';
import 'package:nanny_co/nany/nanny_booking_view/Controller/nannyBooking_Controller.dart';
import 'package:nanny_co/nany/nanny_booking_view/nanny_booking_detail_view.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/nany/nanny_notification_view/nany_notifiation_cuibt_cubit.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Model/parentBookingModel.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';

import '../../parent/parent_drawer.dart/parent_drawer_view.dart';
import '../nanny_drawer.dart/nanny_drawer_view.dart';
import '../nanny_notification_view/nanny_notifications_view.dart';

class NannyHomeView extends StatefulWidget {
  NannyHomeView();

  @override
  State<NannyHomeView> createState() => _NannyHomeViewState();
}

class _NannyHomeViewState extends State<NannyHomeView> {
  final GlobalKey<ScaffoldState> scaffoldkey =  GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    injector.get<SearchNannyCubit>().getBUpcomming();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: nanny_drawer_view(),
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
                                  child: const Icon(
                                    Icons.menu,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NannyNotificationsView()));
                                  },
                                  child: Stack(
                                    children: [
                                      const SizedBox(
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
                                          child: const Center(
                                            child: Text('',
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
                                  'Upcoming Booking'.translate(),
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Image(
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
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upcoming Bookings'.translate(),
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                            Text(
                              DateFormat('HH MMM,yyyy').format(DateTime.now()),
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),)
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.642,
                              child:NotificationListener<OverscrollIndicatorNotification>(
                                onNotification: (OverscrollIndicatorNotification overscroll) {
                                  overscroll.disallowGlow();
                                  return false;
                                },
                                child: BlocBuilder<SearchNannyCubit,SearchNanyState>(
                                  builder: (context, state) {
                                    if(state is NannyGetData){
                                      print(injector.get<SearchNannyCubit>().upcomming?.data?.data?.length);
                                    return ListView.builder(
                                        itemCount: injector.get<SearchNannyCubit>().upcomming?.data?.data?.length??0,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: (
                                            ){
                                              // nannyBookingId='${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).id}';
                                              // nanny_bottombar_viewState.selectedIndex=5;
                                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const nanny_bottombar_view()));
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
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
                                                    padding: const EdgeInsets.all(20),
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
                                                                  '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).userName}',
                                                                  style: GoogleFonts.raleway(
                                                                      color:
                                                                      Colors.black,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 18),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).entryTime} - ${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).exitTime}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.grey.shade800,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 12),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).city} ',
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
                                                                  '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).price} Riyal',
                                                                  style: GoogleFonts.raleway(
                                                                      color:
                                                                      Theme.of(context).primaryColor,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 18),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  'Per Hour'.translate(),
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.grey.shade800,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 12),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Type:${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).sitterType}',
                                                            style: GoogleFonts.raleway(
                                                                color:
                                                                Colors.red,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12),
                                                          ),
                                                          Text(
                                                            'Payment Mode:${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).paymentMode}',
                                                            style: GoogleFonts.raleway(
                                                                color:
                                                                Colors.green,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12),
                                                          ),

                                                        ],
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  'Entry Time'.translate(),
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontSize: 12),
                                                                ), Text(
                                                                  '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).entryTime} (${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).date})',
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
                                                                  'Exit Time'.translate(),
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontSize: 12),
                                                                ), Text(
                                                                  '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).exitTime} (${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).date})',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(context).primaryColor,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 10),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(height: 10,),
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
                                                        const SizedBox(height: 10,),
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
                                                        const SizedBox(height: 10,),
                                                        SizedBox(
                                                          height: 70,
                                                          child: injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).childrenList!=null?ListView.builder(
                                                              itemCount: injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).childrenList?.length??0,
                                                              scrollDirection: Axis.horizontal,
                                                              padding: const EdgeInsets.all(5),
                                                              itemBuilder: (context,index2){
                                                                return Container(
                                                                  height: 50,
                                                                  margin: const EdgeInsets.only(right: 10),
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            padding: const EdgeInsets.all(5),
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
                                                                                          '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).childrenList?.elementAt(index2).image}'
                                                                                      )
                                                                                  )
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(width: 5,),
                                                                          Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).childrenList?.elementAt(index2).name}',
                                                                                style: GoogleFonts.raleway(
                                                                                    color: Theme.of(context).primaryColor,
                                                                                    fontWeight: FontWeight.bold ,
                                                                                    fontSize: 14
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                '${injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).childrenList?.elementAt(index2).gender}',
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
                                                        const SizedBox(height: 10,),


                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: (){
                                                                  injector.get<NanyNotifiationCuibtCubit>().changeBookingStatus(BookingChangeStatusPostModel(bookingId: injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).id, status: 5),context);
                                                                },
                                                                child: Text(
                                                                  '✔ Start',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.green,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 16),
                                                                ),
                                                              ),
                                                              Container(height: 30,color: Colors.grey,width: 2,),
                                                              InkWell(
                                                                onTap: (){
                                                                  injector.get<NanyNotifiationCuibtCubit>().changeBookingStatus(BookingChangeStatusPostModel(bookingId: injector.get<SearchNannyCubit>().upcomming?.data?.data?.elementAt(index).id, status: 4),context);

                                                                },
                                                                child: Text(
                                                                  '✘ Decline',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors.red,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 16),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
