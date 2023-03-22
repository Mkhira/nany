import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/data/model/dto_model/book/book_post_model.dart';
import 'package:nanny_co/data/model/dto_model/book/parent_booking.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/nanny_notification_view/nany_notifiation_cuibt_cubit.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';
import '../../parent/parent_drawer.dart/parent_drawer_view.dart';

class NannyNotificationsView extends StatefulWidget {
  NannyNotificationsView({Key? key}) : super(key: key);

  @override
  State<NannyNotificationsView> createState() => _NannyNotificationsViewState();
}

class _NannyNotificationsViewState extends State<NannyNotificationsView> {
  final GlobalKey<ScaffoldState> scaffoldkey =  GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState

    injector.get<NanyNotifiationCuibtCubit>().getBookingHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: parent_drawer_view(),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
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
                                  'Notifications'.translate(),
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
                  height: sh * 0.8,
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
                        child: Text(
                          'New Bookings'.translate(),
                          style: GoogleFonts.raleway(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),

                      BlocBuilder<NanyNotifiationCuibtCubit,NanyNotifiationCuibtState>(builder: (context,state){

                        return           state is NanyNotifiationCuibtNewBooking?            Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            height: sh * 0.742,
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification:
                                  (OverscrollIndicatorNotification overscroll) {
                                overscroll.disallowGlow();
                                return false;
                              },
                              child: ListView.builder(
                                  itemCount: injector.get<NanyNotifiationCuibtCubit>().newBookins!.data!.data!.length,
                                  itemBuilder: (context, index) {
                                    List<BokingData> dataList = injector.get<NanyNotifiationCuibtCubit>().newBookins!.data!.data!;
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 20, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        border: Border.all(color:Colors.black,width: 0.2),
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
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
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
                                                          dataList[index].city??'' ,
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 18),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          '${dataList[index].entryTime??''}-${dataList[index].exitTime??''}, ${dataList[index].city??''}',
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Colors
                                                                  .grey
                                                                  .shade800,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 12),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${dataList[index].price??''} Riyal',
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 18),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Per Hour'.translate(),
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Colors
                                                                  .grey
                                                                  .shade800,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Type:${dataList[index].sitterType??''}'.translate(),
                                                      style: GoogleFonts.raleway(
                                                          color: Colors.red,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      'Payment Mode: ${dataList[index].paymentMode??''}'.translate(),
                                                      style: GoogleFonts.raleway(
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          'Entry Time'.translate(),
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          dataList[index].entryTime??'',
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          'Exit Time'.translate(),
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          dataList[index].exitTime??'',
                                                          style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey,
                                                              width: 1),
                                                          shape: BoxShape.circle),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 1,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey,
                                                              width: 1),
                                                          shape: BoxShape.circle),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Child Info',
                                                      style: GoogleFonts.raleway(
                                                          color: Colors.black,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),

                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 79,
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: dataList[index].childrenList!.length,
                                                      itemBuilder: (context,index2){
                                                        return  Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center ,
                                                          children: [
                                                            Container(
                                                              padding:
                                                              const EdgeInsets.all(5),
                                                              decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                        spreadRadius:
                                                                        3,
                                                                        blurRadius: 5)
                                                                  ]),
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration:  BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        image: NetworkImage(
                                                                            '${dataList[index].childrenList![index2].image}'))),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  '${dataList[index].childrenList![index2].name}, ${dataList[index].childrenList![index2].age}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Theme.of(
                                                                          context)
                                                                          .primaryColor,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize: 14),
                                                                ),
                                                                Text(
                                                                  'Boy',
                                                                  style: GoogleFonts
                                                                      .raleway(
                                                                      color: Colors
                                                                          .redAccent,
                                                                      fontSize:
                                                                      12),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    injector.get<NanyNotifiationCuibtCubit>().changeBookingStatus(BookingChangeStatusPostModel(bookingId: dataList[index].id, status: 2),context);
                                                  },
                                                  child: Text(
                                                    '✔ Accept',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Container(height: 30,color: Colors.grey,width: 2,),
                                                InkWell(
                                                  onTap: (){
                                                    injector.get<NanyNotifiationCuibtCubit>().changeBookingStatus(BookingChangeStatusPostModel(bookingId: dataList[index].id, status: 4),context);

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
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )) : const CircularProgressIndicator();
                      })
                    ],
                  )),
                ),
              ),
            ])));
  }
}
