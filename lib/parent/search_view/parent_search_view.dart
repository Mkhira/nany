import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/nanny_profile/Controller/update_nanny_profile_cubit.dart';
import 'package:nanny_co/parent/add_child/Controller/add_child_cubit.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/search_view/Controller/parentSearch_Controller.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';
import 'package:nanny_co/parent/search_view/parent_search_result.dart';

import '../auth_view/Controller/Auth_controller.dart';
import '../parent_drawer.dart/parent_drawer_view.dart';

class ParentSearchNanny extends StatefulWidget {
  ParentSearchNanny();

  @override
  State<ParentSearchNanny> createState() => _ParentSearchNannyState();
}

class _ParentSearchNannyState extends State<ParentSearchNanny> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    injector.get<UpdateNannyProfileCubit>().getCites();
    injector.get<AddChildCubit>().getChildList();

    // search_controller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: parent_drawer_view(),
      body: SizedBox(
        height: sh,
        width: sw,
        child: Stack(
          children: [
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
                                  parentFirebaseAuthController().signOut();
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ParentSignInView()));
                                },
                                child: const Icon(
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
                                'Search Nanny ',
                                style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const Image(
                                  image: AssetImage('assets/images/dots.png')),
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
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<UpdateNannyProfileCubit,
                              UpdateNannyProfileState>(
                          builder: (context, state) => (injector
                                  .get<UpdateNannyProfileCubit>()
                                  .cites
                                  .isNotEmpty)
                              ? DropdownButton(
                                  value: injector
                                      .get<UpdateNannyProfileCubit>()
                                      .cityIdValue,
                                  onChanged: (value) {
                                    setState(() {
                                      injector
                                          .get<UpdateNannyProfileCubit>()
                                          .changeDropDownButton(
                                              int.parse(value.toString()));
                                    });
                                  },
                                  items: injector
                                      .get<UpdateNannyProfileCubit>()
                                      .cites
                                      .map((city) {
                                    return DropdownMenuItem(
                                        value: city.id, child: Text(city.name));
                                  }).toList(),
                                )
                              : SizedBox()),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Entry Time',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  TimeOfDay? data = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  injector.get<SearchNannyCubit>().start =
                                      data!.format(context).toString();
                                  var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2035),
                                  );
                                  injector.get<SearchNannyCubit>().startdate =
                                      DateFormat('MMM,dd,yyyy').format(date!);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 20, bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.clock_fill,
                                        color: Colors.grey.shade400,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            injector
                                                .get<SearchNannyCubit>()
                                                .start,
                                            style: GoogleFonts.raleway(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            injector
                                                .get<SearchNannyCubit>()
                                                .startdate,
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Exit Time',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  TimeOfDay? data = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  injector.get<SearchNannyCubit>().end =
                                      data!.format(context).toString();
                                  var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2035),
                                  );
                                  injector.get<SearchNannyCubit>().enddate =
                                      DateFormat('MMM,dd,yyyy').format(date!);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 20, bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.clock_fill,
                                        color: Colors.grey.shade400,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            injector
                                                .get<SearchNannyCubit>()
                                                .end,
                                            style: GoogleFonts.raleway(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            injector
                                                .get<SearchNannyCubit>()
                                                .enddate,
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Select Child',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      BlocBuilder<AddChildCubit, AddChildState>(
                        builder: (context, state) => Visibility(
                          visible: injector
                              .get<AddChildCubit>()
                              .childList
                              .isNotEmpty,
                          child: SizedBox(
                              height: 150,
                              child: ListView.builder(
                                  itemCount: injector
                                      .get<AddChildCubit>()
                                      .childList
                                      .length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          Visibility(
                                            visible: index <=
                                                injector
                                                    .get<AddChildCubit>()
                                                    .childList
                                                    .length,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey.shade300,
                                                            spreadRadius: 3,
                                                            blurRadius: 5)
                                                      ]),
                                                  child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                injector
                                                                    .get<
                                                                        AddChildCubit>()
                                                                    .childList
                                                                    .elementAt(
                                                                        index)
                                                                    .image))),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  injector
                                                      .get<AddChildCubit>()
                                                      .childList
                                                      .elementAt(index)
                                                      .name,
                                                  style: GoogleFonts.raleway(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  injector
                                                      .get<AddChildCubit>()
                                                      .childList
                                                      .elementAt(index)
                                                      .gender,
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.redAccent,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: injector
                                                    .get<AddChildCubit>()
                                                    .childList
                                                    .length ==
                                                index + 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  injector
                                                      .get<AddChildCubit>()
                                                      .getChildList();
                                                  parent_bottombar_viewState
                                                      .selectedIndex = 11;
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const parent_bottombar_view()));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        height: 75,
                                                        width: 75,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
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
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.grey,
                                                          ),
                                                        )),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Add Child',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14),
                                                    ),
                                                    Text(
                                                      '',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              color: Colors
                                                                  .redAccent,
                                                              fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: ()async {
                              await injector.get<SearchNannyCubit>().searchNanny();
                              parent_bottombar_viewState.selectedIndex = 12;
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const parent_bottombar_view()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10),
                              child: Center(
                                child: Text(
                                  'Search Nanny ',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
