import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Controller/parentBooking_Controller.dart';
import 'package:nanny_co/parent/parent_nanny_booking/Model/parentBookingModel.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';

import '../parent_drawer.dart/parent_drawer_view.dart';

class ParentBookingHistory extends StatefulWidget {
  ParentBookingHistory();

  @override
  State<ParentBookingHistory> createState() => _ParentBookingHistoryState();
}

class _ParentBookingHistoryState extends State<ParentBookingHistory> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  parentBooking_Controller controller=new parentBooking_Controller();
   @override
  void initState() {
    // TODO: implement initState

     injector.get<SearchNannyCubit>().getBookingHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: parent_drawer_view(),
        body: BlocBuilder<SearchNannyCubit,SearchNanyState>(builder: (context,state)=> Container(
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
                                  child: const Icon(
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
                                  'Booking History'.translate(),
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
                  height: sh * 0.69,
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
                              'Booking History'.translate(),
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              height: sh * 0.642,
                              child: injector.get<SearchNannyCubit>().bookingsHistory != null? ListView.builder(
                                  itemCount: injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        bookingId=injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).id!.toString();
                                        parent_bottombar_viewState.selectedIndex=8;
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const parent_bottombar_view()));
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
                                                            '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).fullName}',
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
                                                            '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).entryTime} - ${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data![index].exitTime}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors.grey.shade800,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 12),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).city}',
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
                                                            '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).price} Riyal',
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
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Type: ${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).sitterType}',
                                                        style: GoogleFonts.raleway(
                                                            color:
                                                            Colors.red,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        'Payment Mode:${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data![index].paymentMode}',
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
                                                            '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).exitTime} (${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).date})',
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
                                                            '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).exitTime} (${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).date})',
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
                                                  Container(
                                                    height: 70,
                                                    child: injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).childrenList!=null?ListView.builder(
                                                        itemCount: injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).childrenList!.length,
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
                                                                                    '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).childrenList!.elementAt(index2).image}'
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
                                                                          '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).childrenList!.elementAt(index2).name}',
                                                                          style: GoogleFonts.raleway(
                                                                              color: Theme.of(context).primaryColor,
                                                                              fontWeight: FontWeight.bold ,
                                                                              fontSize: 14
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          '${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).childrenList!.elementAt(index2).gender}',
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
                                                'Rate ${injector.get<SearchNannyCubit>().bookingsHistory!.data!.data!.elementAt(index).userName}',
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
                                  }):SizedBox())
                        ],
                      )),
                ),
              ),
            ])),));
  }
}
