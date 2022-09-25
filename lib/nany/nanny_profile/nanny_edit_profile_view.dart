import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/auth_view/Controller/Auth_controller.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';
import 'package:nanny_co/nany/nanny_drawer.dart/nanny_drawer_view.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';

import '../nanny_bottombar_view/nanny_bottombar_view.dart';
import '../nanny_notification_view/nanny_notifications_view.dart';
import 'Controller/nannyProfile_Controller.dart';

class nanny_edit_profile_view extends StatefulWidget {
  nanny_edit_profile_view();

  @override
  State<nanny_edit_profile_view> createState() =>
      _nanny_edit_profile_viewState();
}

class _nanny_edit_profile_viewState extends State<nanny_edit_profile_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  RangeValues _currentRangeValues = const RangeValues(0, 100);

  nannyProfile_Controller profile_controller =
      Get.put(nannyProfile_Controller());

  TextEditingController fullName = new TextEditingController();
  TextEditingController entry = new TextEditingController();
  TextEditingController exit = new TextEditingController();
  TextEditingController date = new TextEditingController();

  TextEditingController dob = new TextEditingController();

  TextEditingController address = new TextEditingController();

  TextEditingController city = new TextEditingController();

  TextEditingController course = new TextEditingController();

  TextEditingController university = new TextEditingController();

  TextEditingController uniCity = new TextEditingController();

  TextEditingController phone = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController experience = new TextEditingController();

  TextEditingController children = new TextEditingController();

  TextEditingController nic = new TextEditingController();

  bool gender = false;

  bool special = false;

  var image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  nanny_notifications_view()));
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
                                              color: Colors.purple.shade400,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '11',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Profile ',
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
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                      Text(
                        'Nanny Information',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Full Name',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: fullName,
                              onChanged: (value) {
                                profile_controller.nannyModel.value.fullname =
                                    value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.fullname == null ? "" : profile_controller.nannyModel.value.fullname}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Upload Photo',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: InkWell(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.image, allowMultiple: false);
                            if (result != null) {
                              var file = result.files.single.path;
                              var name = result.files.single.name;
                              FirebaseStorage storage =
                                  FirebaseStorage.instance;
                              Reference ref =
                                  storage.ref().child('profile_images').child(result.files.single.name+FirebaseAuth.instance.currentUser!.uid);
                              await ref.putFile(File(file!));
                              var upload = await ref.getDownloadURL();
                              if (upload != null) {
                                profile_controller.nannyModel.value.image =
                                    upload;
                              }
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: Obx(() => TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabled: false,
                                  hintText:
                                      '${profile_controller.nannyModel.value.image == null ? "" : profile_controller.nannyModel.value.image}',
                                  suffixIcon: Icon(
                                    Icons.upload_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: GoogleFonts.raleway(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Date of Birth',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: dob,
                              onChanged: (value) {
                                profile_controller.nannyModel.value.dob = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.dob == null ? "" : profile_controller.nannyModel.value.dob}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Gender',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                profile_controller.nannyModel.value.gender =
                                    'Male';
                              });
                            },
                            child: Obx(() => Container(
                                  height: 50,
                                  width: sw * 0.43,
                                  decoration: BoxDecoration(
                                      color: profile_controller
                                                  .nannyModel.value.gender ==
                                              "Male"
                                          ? Colors.green.shade500
                                          : Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Male',
                                        style: GoogleFonts.raleway(
                                            color: profile_controller.nannyModel
                                                        .value.gender ==
                                                    "Male"
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                profile_controller.nannyModel.value.gender =
                                    'Female';
                              });
                            },
                            child: Obx(() => Container(
                                  height: 50,
                                  width: sw * 0.45,
                                  decoration: BoxDecoration(
                                      color: profile_controller
                                                  .nannyModel.value.gender ==
                                              "Female"
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Female',
                                        style: GoogleFonts.raleway(
                                            color: profile_controller.nannyModel
                                                        .value.gender ==
                                                    "Female"
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sitter Type',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    profile_controller.nannyModel.value.type =
                                        'Sitter';
                                  });
                                },
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Sitter',
                                    enabled: false,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    prefixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          profile_controller
                                              .nannyModel.value.type = 'Sitter';
                                        });
                                      },
                                      child: Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: profile_controller.nannyModel
                                                        .value.type ==
                                                    "Sitter"
                                                ? Colors.green
                                                : Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                topLeft: Radius.circular(15)),
                                            border: Border.all(
                                                color: Colors.grey, width: 1)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.check,
                                                color: profile_controller
                                                            .nannyModel
                                                            .value
                                                            .type ==
                                                        "Sitter"
                                                    ? Colors.white
                                                    : Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    hintStyle: GoogleFonts.raleway(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    profile_controller.nannyModel.value.type =
                                        'Goto Sitter';
                                  });
                                },
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabled: false,
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Goto Sitter',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    prefixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          profile_controller.nannyModel.value
                                              .type = 'Goto Sitter';
                                        });
                                      },
                                      child: Obx(() => Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: profile_controller
                                                            .nannyModel
                                                            .value
                                                            .type ==
                                                        "Goto Sitter"
                                                    ? Colors.green
                                                    : Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    topLeft:
                                                        Radius.circular(15)),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: profile_controller
                                                                .nannyModel
                                                                .value
                                                                .type ==
                                                            "Goto Sitter"
                                                        ? Colors.white
                                                        : Colors.grey.shade400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                    hintStyle: GoogleFonts.raleway(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Address',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Address',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: address,
                              onChanged: (value) {
                                profile_controller
                                    .nannyModel.value.address?.address = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.address?.address == null ? "" : profile_controller.nannyModel.value.address?.address}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'City',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: city,
                              onChanged: (value) {
                                profile_controller
                                    .nannyModel.value.address?.city = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.address?.city == null ? "" : profile_controller.nannyModel.value.address?.city}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Education',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Course Name',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: course,
                              onChanged: (value) {
                                profile_controller
                                    .nannyModel.value.education?.course = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.education?.course == null ? "" : profile_controller.nannyModel.value.education?.course}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'University Name',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: university,
                              onChanged: (value) {
                                profile_controller.nannyModel.value.education
                                    ?.university = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.education?.university == null ? "" : profile_controller.nannyModel.value.education?.university}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'City',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: uniCity,
                              onChanged: (value) {
                                profile_controller
                                    .nannyModel.value.education?.city = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.education?.city == null ? "" : profile_controller.nannyModel.value.education?.city}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Phone / Email',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Phone Number',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: phone,
                              onChanged: (value) {
                                profile_controller.nannyModel.value.mobile =
                                    value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.mobile == null ? "" : profile_controller.nannyModel.value.mobile}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: email,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.email == null ? "" : profile_controller.nannyModel.value.email}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Personal Information',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Total Experience',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: experience,
                              onChanged: (value) {
                                profile_controller.nannyModel.value.experience =
                                    value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.experience == null ? "" : profile_controller.nannyModel.value.experience}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Special Needs',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              profile_controller.nannyModel.value.special ==
                                      true
                                  ? profile_controller
                                      .nannyModel.value.special = false
                                  : profile_controller
                                      .nannyModel.value.special = true;
                            });
                          },
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabled: false,
                              hintText: 'Specialize in special needs',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              prefixIcon: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                    color: profile_controller
                                                .nannyModel.value.special ==
                                            true
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.check,
                                        color: profile_controller
                                                    .nannyModel.value.special ==
                                                true
                                            ? Colors.white
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              hintStyle: GoogleFonts.raleway(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No. of Children Willing to care',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(() => TextField(
                              controller: children,
                              onChanged: (value) {
                                profile_controller.nannyModel.value.children =
                                    int.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                    '${profile_controller.nannyModel.value.children == null ? "" : profile_controller.nannyModel.value.children}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'National ID',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Choose ID',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: GoogleFonts.raleway(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          value: 'Select Indentification',
                          items: ['Select Indentification', 'Nic', 'Passport']
                              .map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ID Number',
                        style: GoogleFonts.raleway(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Container(
                        height: 50,
                        child: Obx(
                          () => TextField(
                            controller: nic,
                            onChanged: (value) {
                              profile_controller.nannyModel.value.nic = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText:
                                  '${profile_controller.nannyModel.value.nic == null ? "" : profile_controller.nannyModel.value.nic}',
                              hintStyle: GoogleFonts.raleway(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Charges',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '20 Riyal',
                                style: GoogleFonts.raleway(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '[Min]',
                                style: GoogleFonts.raleway(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '50 Riyal',
                                style: GoogleFonts.raleway(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '[Max]',
                                style: GoogleFonts.raleway(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                      SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 1,
                          ),
                          child: RangeSlider(
                            values: _currentRangeValues,
                            max: 1000,
                            divisions: 1000,
                            activeColor: Theme.of(context).primaryColor,
                            inactiveColor: Colors.grey.shade200,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                                profile_controller.nannyModel.value.minRange =
                                    _currentRangeValues.start;
                                profile_controller.nannyModel.value.maxRange =
                                    _currentRangeValues.end;
                              });
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Availability',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Container(
                                        height: 420,
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Add Availability',
                                                  style: GoogleFonts.raleway(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Date',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            InkWell(
                                              onTap: () async{
                                              var data=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000),
                                                lastDate: DateTime(2035),);
                                              date.text=DateFormat('MMM,dd,yyyy').format(data!);
                                              },
                                              child: Container(
                                                height: 50,
                                                child: InkWell(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      enabled: false,
                                                      hintStyle:
                                                          GoogleFonts.raleway(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Start time',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            InkWell(
                                              onTap: () async{
                                               TimeOfDay? data=await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
                                               entry.text=data!.format(context).toString();
                                               },
                                              child: Container(
                                                height: 50,
                                                child: InkWell(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      enabled: false,
                                                      hintStyle:
                                                          GoogleFonts.raleway(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'End time',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            InkWell(
                                              onTap: () async{
                                               var data=await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
                                               exit.text=data!.format(context).toString();
                                              },
                                              child: Container(
                                                height: 50,
                                                child: InkWell(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      enabled: false,
                                                      hintStyle:
                                                          GoogleFonts.raleway(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (date.text.isNotEmpty &&
                                                        entry.text.isNotEmpty &&
                                                        exit.text.isNotEmpty) {
                                                      Availability availability =
                                                      new Availability(
                                                        booked: false,
                                                        date: date.text,
                                                        endTime: exit.text,
                                                        startTime: entry.text,
                                                      );
                                                      profile_controller
                                                          .nannyModel
                                                          .value
                                                          .availability!
                                                          .add(availability);
                                                      Navigator.pop(context);
                                                    } else {
                                                      AnimatedSnackBar.material(
                                                        'Fill out all fields',
                                                        type: AnimatedSnackBarType
                                                            .error,
                                                      ).show(context);
                                                    }
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1000))),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 15.0,
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Submit',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1000))),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Cancel',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                Text(
                                  'Add',
                                  style: GoogleFonts.raleway(
                                      color: Colors.blue, fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profile_controller.nannyModel.value.availability != null
                          ? Container(
                              height: 150,
                              child: ListView.builder(
                                  itemCount: profile_controller
                                      .nannyModel.value.availability!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                            width: 150,
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${profile_controller.nannyModel.value.availability!.elementAt(index).date}        ',
                                                          style: GoogleFonts.raleway(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                        Text(
                                                          'Selected time    ',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                  fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .transparent,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${profile_controller.nannyModel.value.availability!.elementAt(index).startTime}    ',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_sharp,
                                                              color: Colors.grey
                                                                  .shade600,
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '${profile_controller.nannyModel.value.availability!.elementAt(index).startTime}    ',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_sharp,
                                                              color: Colors.grey
                                                                  .shade600,
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Positioned(
                                          right: 0,
                                          child: InkWell(
                                            onTap:(){
                                              setState((){
                                                profile_controller.nannyModel.value.availability!.removeAt(index);
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove_circle,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              CheckEmailUpdate().then((value) => {
                                    if (value == true)
                                      {
                                        profile_controller
                                            .nannyModel.value.email = email.text
                                      },
                                    print(
                                        profile_controller.nannyModel.toJson()),
                                    ProgressPopup(context),
                                    profile_controller.UpdateProfile(
                                            profile_controller.nannyModel
                                                .toJson())
                                        .then((value) {
                                      nanny_bottombar_viewState.selectedIndex =
                                          3;
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  nanny_bottombar_view()));
                                    }),
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Submit',
                                      style: GoogleFonts.raleway(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
                ),
              ),
            ])));
  }

  Future CheckEmailUpdate() async {
    if (email.text.isNotEmpty) {
      print('aya');
      try {
        FirebaseAuth _auth = FirebaseAuth.instance;
        await _auth
            .signInWithEmailAndPassword(
                email: '${profile_controller.nannyModel.value.email}',
                password: '${profile_controller.nannyModel.value.password}')
            .then((userCredential) {
          userCredential.user!.updateEmail(email.text).then((value) {});
        });
        return true;
      } catch (ex) {
        return false;
      }
    }
  }
}
