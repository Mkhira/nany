import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/gallery_view/parent_gallery_view.dart';
import 'package:nanny_co/parent/parent_drawer.dart/parent_drawer_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_book_nanny.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_sitting_started_view.dart';
import 'package:nanny_co/parent/search_view/Controller/parentSearch_Controller.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:get/get.dart';

import '../parent_profile/Controller/parentProfile_Controller.dart';
import 'Controller/parentBooking_Controller.dart';

class ParentNannyDetails extends StatelessWidget {
  ParentNannyDetails();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  List images = [
    'https://images.pexels.com/photos/1556691/pexels-photo-1556691.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.ctfassets.net/hrltx12pl8hq/5GaLeZJlLyOiQC4gOA0qUM/a0398c237e9744ade8b072f99349e07a/shutterstock_152461202_thumb.jpg?fit=fill&w=480&h=270'
  ];
  // parentBooking_Controller booking_controller =
  //     Get.put(parentBooking_Controller());
  parentSearch_Controller search_controller =
      Get.put(parentSearch_Controller());
  parentProfile_Controller profile_controller =
      Get.put(parentProfile_Controller());

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
                                    parent_bottombar_viewState.selectedIndex =
                                        0;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const parent_bottombar_view()));
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
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Nanny Detail'.translate(),
                                    style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
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
                  height: sh * 0.7,
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Obx(() => Text(
                      //             '${search_controller.startdate}',
                      //             style: GoogleFonts.raleway(
                      //                 color: Theme.of(context).primaryColor,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 18),
                      //           )),
                      //       Obx(() => Text(
                      //             '${search_controller.start} - ${search_controller.end} ${profile_controller.parentModel.value.address?.city}',
                      //             style: GoogleFonts.raleway(
                      //                 color: Theme.of(context).primaryColor,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 14),
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        height: 200,
                        width: sw,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  '${injector.get<SearchNannyCubit>().nannyDetails?.data?.image}')),
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
                              padding: const EdgeInsets.all(5),
                              width: sw,
                              decoration: const BoxDecoration(
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
                                        '${injector.get<SearchNannyCubit>().nannyDetails?.data?.nannyName}',
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
                                        '1.5 KM',
                                        style: GoogleFonts.raleway(
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${injector.get<SearchNannyCubit>().nannyDetails?.data?.price} Riyal',
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
                                clipBorderRadius: const BorderRadius.only(
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
                            Text(
                              ' ${injector.get<SearchNannyCubit>().nannyDetails?.data?.nannyName}!',
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: sw * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Education'.translate(),
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${injector.get<SearchNannyCubit>().nannyDetails?.data?.universityName}',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: sw * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Experience'.translate(),
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${injector.get<SearchNannyCubit>().nannyDetails?.data?.totalExperience}\n',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              width: sw,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Take Care of:'.translate(),
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'instant, 5-10 year old',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: sw,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No. of Children Willing to care'.translate(),
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'For one day in same household',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   '${injector.get<SearchNannyCubit>().nannyDetails?.data?.} Children',
                            //   style: GoogleFonts.raleway(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 16),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              height: 1,
                              width: sw,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Qualified for special needs:'.translate(),
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${injector.get<SearchNannyCubit>().nannyDetails?.data?.specialNeeds}',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: sw,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Image Gallery:',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                InkWell(
                                    onTap: () {
                                      parent_bottombar_viewState.selectedIndex =
                                          14;
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const parent_bottombar_view()));
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Theme.of(context).primaryColor,
                                      size: 20,
                                    ))
                              ],
                            ),
                            SizedBox(
                                height: sh * 0.2,
                                width: sw,
                                child: GridView.builder(
                                  itemCount: injector.get<SearchNannyCubit>().nannyDetails?.data?.sitterGallery?.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                spreadRadius: 1,
                                                blurRadius: 10)
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                                  NetworkImage(images[index]))),
                                    );
                                  },
                                )),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    parent_bottombar_viewState.selectedIndex =
                                        5;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const parent_bottombar_view()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10),
                                    child: Center(
                                      child: Text(
                                        'Book Nanny'.translate(),
                                        style: GoogleFonts.raleway(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 50,
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
