import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';

import '../parent_drawer.dart/parent_drawer_view.dart';
import 'Controller/update_parent_cubit/update_parent_cubit.dart';

class ParentEditProfileView extends StatefulWidget {
  const ParentEditProfileView({Key? key}) : super(key: key);

  @override
  State<ParentEditProfileView> createState() => _ParentEditProfileViewState();
}

class _ParentEditProfileViewState extends State<ParentEditProfileView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // parentProfile_Controller profileController=Get.put(parentProfile_Controller());

  TextEditingController email = TextEditingController();

  bool gender = false;

  bool special = false;

  var image;

  @override
  void initState() {
    // TODO: implement initState
    injector.get<UpdateParentCubit>().initialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: parent_drawer_view(),
        body: BlocBuilder<UpdateParentCubit, UpdateParentState>(
          builder: (context, state) => SizedBox(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      scaffoldKey.currentState!.openDrawer();
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
                                    'Profile ',
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Information'.translate(),
                          style: GoogleFonts.raleway(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Full Name'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            onChanged: (value) {
                              injector.get<UpdateParentCubit>().postUpdateParentModel.fullName = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: SettingsProvider.userData.fullName ?? "",
                              hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: const BorderSide(width: 1, color: Colors.grey),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: const BorderSide(width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: const BorderSide(width: 1, color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: const BorderSide(width: 1, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Upload Photo'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          height: 50,
                          child: InkWell(
                              onTap: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                                if (result != null) {
                                  // profileController.parentModel.value.image=upload;
                                  injector.get<UpdateParentCubit>().getImage(File(result.files.single.path!));
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabled: false,
                                  hintText: "image".translate(),
                                  suffixIcon: const Icon(
                                    Icons.upload_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Date of Birth'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: (value) {
                                injector.get<UpdateParentCubit>().postUpdateParentModel.dob = value;
                              },
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: DateFormat('yyyy-MM-dd').format( SettingsProvider.userData.dob!= null && SettingsProvider.userData.dob !=''? DateTime.parse(SettingsProvider.userData.dob!):DateTime.now()) ?? "",
                                hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),

                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Gender'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    injector.get<UpdateParentCubit>().postUpdateParentModel.gender = 'Male';
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.43,
                                  decoration: BoxDecoration(
                                      color: injector.get<UpdateParentCubit>().postUpdateParentModel.gender == "Male"
                                          ? Colors.green.shade500
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100)),
                                      border: Border.all(width: 1, color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Male'.translate(),
                                        style: GoogleFonts.raleway(
                                            color: injector.get<UpdateParentCubit>().postUpdateParentModel.gender == "Male"
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    injector.get<UpdateParentCubit>().postUpdateParentModel.gender = 'Female';
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.45,
                                  decoration: BoxDecoration(
                                      color: injector.get<UpdateParentCubit>().postUpdateParentModel.gender == "Female"
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius:
                                          const BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                                      border: Border.all(width: 1, color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Female'.translate(),
                                        style: GoogleFonts.raleway(
                                            color: injector.get<UpdateParentCubit>().postUpdateParentModel.gender == "Female"
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Address'.translate(),
                          style: GoogleFonts.raleway(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Address'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: (value) {
                                injector.get<UpdateParentCubit>().postUpdateParentModel.address = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: SettingsProvider.userData.address ?? "",
                                hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),

                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'City'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        if (injector.get<UpdateParentCubit>().cites.isNotEmpty) ...[
                          DropdownButton(
                            value: injector.get<UpdateParentCubit>().cityIdValue,
                            onChanged: (value) {
                              setState(() {
                                injector.get<UpdateParentCubit>().changeDropDownButton(int.parse(value.toString()));
                              });
                            },
                            items: injector.get<UpdateParentCubit>().cites.map((city) {
                              return DropdownMenuItem(value: city.id, child: Text(city.name));
                            }).toList(),
                          )
                        ],
                        // SizedBox(
                        //   height: 50,
                        //   child:Obx(()=> TextField(
                        //     onChanged: (value){
                        //       profileController.parentModel.value.address?.city=value;
                        //     },
                        //     decoration: InputDecoration(
                        //       fillColor: Colors.white,
                        //       filled: true,
                        //       hintText: profileController.parentModel.value.address?.city ?? "",
                        //       hintStyle: GoogleFonts.raleway(
                        //           color:Colors.grey.shade400,
                        //           fontWeight: FontWeight.w500,
                        //           fontSize:16),
                        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                        //         borderSide: const BorderSide(width: 1,color: Colors.grey),
                        //       ),
                        //       disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                        //         borderSide: const BorderSide(width: 1,color: Colors.grey),
                        //       ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                        //       borderSide: const BorderSide(width: 1,color: Colors.grey),
                        //     ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                        //       borderSide: const BorderSide(width: 1,color: Colors.grey),
                        //     ),
                        //     ),
                        //   )),
                        // ),

                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Phone'.translate(),
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: (value) {
                                injector.get<UpdateParentCubit>().postUpdateParentModel.phone = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: SettingsProvider.userData.phone ?? "",
                                hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),

                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Email',
                          style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                            height: 50,
                            child: TextField(
                              controller: email,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: SettingsProvider.userData.email ?? "",
                                hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(150),
                                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                                ),
                              ),
                            )),

                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              // checkEmailUpdate().then((value) => {
                              //   if(value==true){
                              //     injector.get<UpdateParentCubit>().postUpdateParentModel.email=email.text
                              //   },
                              //   ProgressPopup(context),
                              //   profileController.UpdateProfile(profileController.parentModel.toJson()).then((value){
                              //     parent_bottombar_viewState.selectedIndex=3;
                              //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const parent_bottombar_view()));
                              //   }),
                              // });

                              bool value = await injector.get<UpdateParentCubit>().updateParent(context);
                              if (value == true) {
                                setState(() {
                                  parent_bottombar_viewState.selectedIndex = 3;
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(builder: (context) => const parent_bottombar_view()));
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Submit',
                                      style: GoogleFonts.raleway(color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                  ),
                ),
              ])),
        ));
  }

  // Future checkEmailUpdate()async{
  //   if(email.text.isNotEmpty){
  //     try{
  //       FirebaseAuth _auth = FirebaseAuth.instance;
  //       await _auth
  //           .signInWithEmailAndPassword( email: '${profileController.parentModel.value.email}',password: '${profileController.parentModel.value.password}')
  //           .then((userCredential) {
  //         userCredential.user!.updateEmail(email.text).then((value){
  //         });
  //       });
  //       return true;
  //     }catch(ex){
  //       return false;
  //     }
  //   }
  // }
}
