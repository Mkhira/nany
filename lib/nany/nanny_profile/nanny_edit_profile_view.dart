import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
import 'package:nanny_co/data/model/dto_model/nany/post_appointment_data.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';
import 'package:nanny_co/nany/nanny_drawer.dart/nanny_drawer_view.dart';
import '../nanny_bottombar_view/nanny_bottombar_view.dart';
import '../nanny_notification_view/nanny_notifications_view.dart';
import 'Controller/nannyProfile_Controller.dart';
import 'Controller/update_nanny_profile_cubit.dart';

class NannyEditProfileView extends StatefulWidget {
  const NannyEditProfileView({Key? key}) : super(key: key);

  @override
  State<NannyEditProfileView> createState() =>
      _NannyEditProfileViewState();
}

class _NannyEditProfileViewState extends State<NannyEditProfileView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RangeValues _currentRangeValues = const RangeValues(0, 100);

  nannyProfile_Controller profile_controller =
      Get.put(nannyProfile_Controller());

  TextEditingController fullName = TextEditingController();
  TextEditingController entry = TextEditingController();
  TextEditingController exit = TextEditingController();
  TextEditingController date = TextEditingController();

  TextEditingController dob = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController course = TextEditingController();

  TextEditingController university = TextEditingController();

  TextEditingController uniCity = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController experience = TextEditingController();

  TextEditingController children = TextEditingController();

  TextEditingController nic = TextEditingController();

  bool gender = false;

  bool special = false;

  var image;

  @override
  void initState() {
    // TODO: implement initState
    injector.get<UpdateNannyProfileCubit>().initialValue();
    injector.get<UpdateNannyProfileCubit>().getNannyDetails(SettingsProvider.userData.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: nanny_drawer_view(),
        body: BlocBuilder<UpdateNannyProfileCubit,UpdateNannyProfileState>(builder: (context,state)=> SizedBox(
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
                                              color: Colors.purple.shade400,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Center(
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                          Text(
                            'Nanny Information',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Full Name',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child:  TextField(
                              controller: fullName,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.fullName =
                                    value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                SettingsProvider.userData.fullName,
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Upload Photo',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: InkWell(
                              onTap: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                                if (result != null) {
                                  // profileController.parentModel.value.image=upload;
                                  injector.get<UpdateNannyProfileCubit>().getImage(File(result.files.single.path!));
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child:  TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabled: false,

                                  hintText: SettingsProvider.userData.image??'',
                                  suffixIcon: const Icon(
                                    Icons.upload_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: GoogleFonts.raleway(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Date of Birth',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: dob,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.dob= value;
                              },
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: DateFormat('yyyy-MM-dd').format(SettingsProvider.userData.dob!) ?? "",
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
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
                                    injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.gender =
                                    'Male';
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.43,
                                  decoration: BoxDecoration(
                                      color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.gender ==
                                          "Male"
                                          ? Colors.green.shade500
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
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
                                            color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.gender ==
                                                "Male"
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.gender =
                                    'Female';
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.45,
                                  decoration: BoxDecoration(
                                      color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.gender ==
                                          "Female"
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
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
                                            color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.gender ==
                                                "Female"
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),     Text(
                            'Lesson type',
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
                                    injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.lessonsType = 1;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.43,
                                  decoration: BoxDecoration(
                                      color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.lessonsType== 1
                                          ? Colors.green.shade500
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
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
                                        'Follow lessons',
                                        style: GoogleFonts.raleway(
                                            color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.lessonsType ==
                                                1
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.lessonsType = 2;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.45,
                                  decoration: BoxDecoration(
                                      color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.lessonsType ==
                                          2
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
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
                                        'the lessons online',
                                        style: GoogleFonts.raleway(
                                            color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.lessonsType ==
                                                2
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sitter Type',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType =
                                        'Home Sitter';
                                      });
                                    },
                                    child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Home Sitter',
                                        enabled: false,
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        prefixIcon: InkWell(
                                          onTap: () {
                                            setState(() {

                                              injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType  = 'Home Sitter';
                                            });
                                          },
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType ==
                                                    "Home Sitter"
                                                    ? Colors.green
                                                    : Colors.white,
                                                borderRadius: const BorderRadius.only(
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
                                                    color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType ==
                                                        "Home Sitter"
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
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType =
                                        'Goto Sitter';
                                      });
                                    },
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabled: false,
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Goto Sitter',
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        prefixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType = 'Goto Sitter';
                                            });
                                          },
                                          child:  Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType ==
                                                    "Goto Sitter"
                                                    ? Colors.green
                                                    : Colors.white,
                                                borderRadius: const BorderRadius.only(
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
                                                    color:  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.sitterType ==
                                                        "Goto Sitter"
                                                        ? Colors.white
                                                        : Colors.grey.shade400,
                                                  ),
                                                )
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
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Address',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Address',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: address,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.address = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: SettingsProvider.userData.address??'',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'City',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          if (injector.get<UpdateNannyProfileCubit>().cites.isNotEmpty) ...[
                            DropdownButton(
                              value: injector.get<UpdateNannyProfileCubit>().cityIdValue,
                              onChanged: (value) {
                                setState(() {
                                  injector.get<UpdateNannyProfileCubit>().changeDropDownButton(int.parse(value.toString()));
                                });
                              },
                              items: injector.get<UpdateNannyProfileCubit>().cites.map((city) {
                                return DropdownMenuItem(value: city.id, child: Text(city.name));
                              }).toList(),
                            )
                          ],
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Education',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Course Name',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child:  TextField(
                              controller: course,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.courseName = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: SettingsProvider.userData.courseName??'',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'University Name',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: university,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.universityName = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:  SettingsProvider.userData.universityName,
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'City Education',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          if (injector.get<UpdateNannyProfileCubit>().cites.isNotEmpty) ...[
                            DropdownButton(
                              value: injector.get<UpdateNannyProfileCubit>().cityIdEducationValue,
                              onChanged: (value) {
                                setState(() {
                                  injector.get<UpdateNannyProfileCubit>().changeDropDownButtonEducation(int.parse(value.toString()));
                                });
                              },
                              items: injector.get<UpdateNannyProfileCubit>().cites.map((city) {
                                return DropdownMenuItem(value: city.id, child: Text(city.name));
                              }).toList(),
                            )
                          ],

                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Phone / Email',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Phone Number',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child:  TextField(
                              controller: phone,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.phone=
                                    value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:
                                SettingsProvider.userData.phone,

                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child:  TextField(
                              controller: email,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.email = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:SettingsProvider.userData.email,
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Personal Information',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Total Experience',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child:  TextField(
                              controller: experience,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.totalExperience =
                                    int.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText:'${SettingsProvider.userData.totalExperience}',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Special Needs',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.specialNeeds ==
                                      'Yes'
                                      ? injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.specialNeeds = 'No'
                                      : injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.specialNeeds = 'Yes';
                                });
                              },
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabled: false,
                                  hintText: 'Specialize in special needs',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  prefixIcon: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.specialNeeds ==
                                            'Yes'
                                            ? Colors.green
                                            : Colors.white,
                                        borderRadius: const BorderRadius.only(
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
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'No. of Children Willing to care',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child:  TextField(
                              controller: children,
                              onChanged: (value) {
                                injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.noOfChildren =
                                    value;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: SettingsProvider.userData.noOfChildren.toString()??'',
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'National ID',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Choose ID',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                              value: injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.idType,
                              items: [ 'Nic', 'Passport']
                                  .map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.idType = value.toString();
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ID Number',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                                onChanged: (value) {
                                  injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.idNumber = value;
                                },
                                    keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: SettingsProvider.userData.idNumber??'',
                                  hintStyle: GoogleFonts.raleway(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                ),

                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Charges',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
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
                              data: const SliderThemeData(
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
                                    injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.minPrice =
                                        _currentRangeValues.start.toString();
                                    injector.get<UpdateNannyProfileCubit>().postUpdateSisterProfileModel.maxPrice =
                                        _currentRangeValues.end.toString();
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
                                            padding: const EdgeInsets.all(20),
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
                                                const SizedBox(
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
                                                    date.text=DateFormat('yyyy-MM-dd').format(data!);
                                                  },
                                                  child: SizedBox(
                                                    height: 50,
                                                    child: InkWell(
                                                      child: TextField(
                                                        controller: date,
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
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          disabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
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
                                                    entry.text= '${data!.hour.toString().padLeft(2, '0')}:${data!.minute.toString().padLeft(2, '0')}';
                                                  },
                                                  child: SizedBox(
                                                    height: 50,
                                                    child: InkWell(
                                                      child: TextField(
                                                        controller: entry,
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
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          disabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
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
                                                    exit.text= '${data!.hour.toString().padLeft(2, '0')}:${data!.minute.toString().padLeft(2, '0')}';
                                                  },
                                                  child: SizedBox(
                                                    height: 50,
                                                    child: InkWell(
                                                      child: TextField(
                                                        controller: exit,
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
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          disabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                            borderSide: const BorderSide(
                                                                width: 1,
                                                                color: Colors.grey),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      setState(() async{
                                                        if (date.text.isNotEmpty &&
                                                            entry.text.isNotEmpty &&
                                                            exit.text.isNotEmpty) {
                                                          Availability availability =
                                                          Availability(
                                                            booked: false,
                                                            date: date.text,
                                                            endTime: exit.text,
                                                            startTime: entry.text,
                                                          );
                                                          await injector.get<UpdateNannyProfileCubit>().addAppointment(PostAppointment(date: date.text, timeFrom: entry.text, timeTo: exit.text));
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
                                                      padding: const EdgeInsets.symmetric(
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
                                                const SizedBox(
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
                                                      padding: const EdgeInsets.symmetric(
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
                                    const Icon(
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
                          const SizedBox(
                            height: 20,
                          ),
                          injector.get<UpdateNannyProfileCubit>().nannyDetails?.data?.availability != null
                              ? SizedBox(
                            height: 150,
                            child: ListView.builder(
                                itemCount: injector.get<UpdateNannyProfileCubit>().nannyDetails?.data?.availability!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                          width: 150,

                                          margin: const EdgeInsets.all(10),
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
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: const BoxDecoration(
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
                                                        '${    injector.get<UpdateNannyProfileCubit>().nannyDetails?.data?.availability!.elementAt(index).date}        ',
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
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: const BoxDecoration(
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
                                                            '${    injector.get<UpdateNannyProfileCubit>().nannyDetails?.data?.availability!.elementAt(index).timeFrom}    ',
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
                                                            '${    injector.get<UpdateNannyProfileCubit>().nannyDetails?.data?.availability!.elementAt(index).timeTo}    ',
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
                                          child: const Icon(
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: ElevatedButton(
                                onPressed: () async{
                                  bool value = await injector.get<UpdateNannyProfileCubit>().updateNanny(context);
                                  if (value == true) {
                                    setState(() {
                                      nanny_bottombar_viewState.selectedIndex = 3;
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(builder: (context) => const nanny_bottombar_view()));
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1000))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
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
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                ),
              ),
            ])),));
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
