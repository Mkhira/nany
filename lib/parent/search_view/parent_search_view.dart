import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/search_view/Controller/parentSearch_Controller.dart';
import 'package:nanny_co/parent/search_view/parent_search_result.dart';

import '../auth_view/Controller/Auth_controller.dart';
import '../parent_drawer.dart/parent_drawer_view.dart';

class parent_search_view extends StatefulWidget {
  parent_search_view();

  @override
  State<parent_search_view> createState() => _parent_search_viewState();
}

class _parent_search_viewState extends State<parent_search_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  parentSearch_Controller search_controller =
      Get.put(parentSearch_Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    search_controller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: parent_drawer_view(),
      body: Container(
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
                                child: Icon(
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
                                'Search Nanny ',
                                style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Image(
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
                padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
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
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: search_controller.search,
                        onFieldSubmitted: (value) {
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search...',
                          suffixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                          hintStyle: GoogleFonts.raleway(
                              color: Colors.grey.shade400, fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ),
                      SizedBox(
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
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap:()async{
                                  TimeOfDay? data=await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
                                  search_controller.start.value=data!.format(context).toString();
                                  var date=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000),
                                    lastDate: DateTime(2035),);
                                  search_controller.startdate.value=DateFormat('MMM,dd,yyyy').format(date!);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
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
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                         Obx(()=> Text(
                                            '${search_controller.start.value}',
                                            style: GoogleFonts.raleway(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Obx(()=>Text(
                                            '${search_controller.startdate.value}',
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
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
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap:()async{
                                  TimeOfDay? data=await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
                                  search_controller.end.value=data!.format(context).toString();
                                  var date=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000),
                                    lastDate: DateTime(2035),);
                                  search_controller.enddate.value=DateFormat('MMM,dd,yyyy').format(date!);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
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
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Obx(()=> Text(
                                            '${search_controller.end.value}',
                                            style: GoogleFonts.raleway(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Obx(()=>Text(
                                            '${search_controller.enddate.value}',
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Select Child',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Visibility(
                        visible: search_controller.parentModel != null,
                        child: Container(
                          height: 150,
                          child: Obx(() => search_controller
                                  .parentModel.value.children!.isNotEmpty
                              ? ListView.builder(
                                  itemCount: search_controller
                                              .parentModel.value.children !=
                                          null
                                      ? search_controller
                                          .parentModel.value.children!.length
                                      : 1,
                                  padding: EdgeInsets.symmetric(
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
                                                search_controller.parentModel
                                                    .value.children!.length,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5),
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
                                                                '${search_controller.parentModel.value.children!.elementAt(index).image}'))),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Obx(() => Text(
                                                      '${search_controller.parentModel.value.children!.elementAt(index).name}',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14),
                                                    )),
                                                Obx(() => Text(
                                                      '${search_controller.parentModel.value.children!.elementAt(index).gender}',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              color: Colors
                                                                  .redAccent,
                                                              fontSize: 12),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: search_controller
                                                    .parentModel
                                                    .value
                                                    .children!
                                                    .length ==
                                                index + 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  parent_bottombar_viewState
                                                      .selectedIndex = 11;
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  parent_bottombar_view()));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        height: 75,
                                                        width: 75,
                                                        padding:
                                                            EdgeInsets.all(5),
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
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.grey,
                                                          ),
                                                        )),
                                                    SizedBox(
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
                                  })
                              : InkWell(
                                  onTap: () {
                                    parent_bottombar_viewState.selectedIndex =
                                        11;
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                parent_bottombar_view()));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 75,
                                          width: 75,
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade300,
                                                    spreadRadius: 3,
                                                    blurRadius: 5)
                                              ]),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Add Child',
                                        style: GoogleFonts.raleway(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        '',
                                        style: GoogleFonts.raleway(
                                            color: Colors.redAccent,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )),
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.1,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              parent_bottombar_viewState.selectedIndex = 12;
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          parent_bottombar_view()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
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
