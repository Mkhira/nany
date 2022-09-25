import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/role_selection_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/nany/nanny_drawer.dart/nanny_drawer_view.dart';
import 'package:nanny_co/nany/nanny_profile/Controller/nannyProfile_Controller.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';

import '../auth_view/Controller/Auth_controller.dart';

class nanny_profile_view extends StatefulWidget{
  nanny_profile_view();

  @override
  State<nanny_profile_view> createState() => _nanny_profile_viewState();
}

class _nanny_profile_viewState extends State<nanny_profile_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  final nannyProfile_Controller profile_controller=Get.put(nannyProfile_Controller());
  @override
  void initState() {
    super.initState();
    profile_controller.getProfileData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: nanny_drawer_view(),
      body: Container(
        height: sh,
        width: sw,
        child: Stack(
          children: [
            Container(
                height: sh*0.35,
                width: sw,
                color: Theme.of(context).primaryColor,
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  scaffoldkey.currentState!.openDrawer();
                                },
                                child: Icon(Icons.menu,size: 20,color: Colors.white,),
                              ),
                              InkWell(
                                onTap: (){
                                  nanyFirebaseAuthController().signOut();
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>role_selection_view()));
                                },
                                child: Icon(Icons.logout,size: 20,color: Colors.white,),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Profile ',
                                style: GoogleFonts.raleway(
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),
                              Image(image:AssetImage('assets/images/dots.png')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: sh*0.71,
                width: sw,
                padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(()=> Container(
                            height:90,
                            width: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white,width: 2),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        '${profile_controller.nannyModel.value.image}',
                                    )
                                )
                            ),
                          )
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Obx(()=> Text(
                                '${profile_controller.nannyModel.value.fullname==null?"":profile_controller.nannyModel.value.fullname}',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              )),
                             Obx(()=> Text(
                                '${profile_controller.nannyModel.value.address?.city==null?"":profile_controller.nannyModel.value.address?.city}',
                                style: GoogleFonts.raleway(
                                    color:Colors.redAccent,
                                    fontSize: 12
                                ),
                              )),
                              SizedBox(height: 5,),
                              Container(
                                height: 30,
                                child: ElevatedButton(onPressed: (){
                                  nanny_bottombar_viewState.selectedIndex=4;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>nanny_bottombar_view()));
                                },
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))
                                    ),
                                    child:Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:5),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(FontAwesomeIcons.edit,size: 12,),
                                            Text(
                                              ' Edit Profile',
                                              style: GoogleFonts.raleway(
                                                  color:Colors.white,
                                                  fontSize: 12
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: sw,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 2,
                            blurRadius: 10,
                          )],
                          border: Border.all(width: 5,color: Colors.white,),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: GoogleFonts.raleway(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      ),
                                     Obx(()=> Text(
                                       '${profile_controller.nannyModel.value.mobile==null?"":profile_controller.nannyModel.value.mobile}',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Divider(thickness: 2,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email',
                                        style: GoogleFonts.raleway(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      ),
                                      Obx(()=>Text(
                                        '${profile_controller.nannyModel.value.email==null?"":profile_controller.nannyModel.value.email}',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Divider(thickness: 2,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Birthday',
                                        style: GoogleFonts.raleway(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      ),
                                     Obx(()=> Text(
                                        '${profile_controller.nannyModel.value.dob==null?"":profile_controller.nannyModel.value.dob}',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Divider(thickness: 2,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gender',
                                        style: GoogleFonts.raleway(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      ),
                                     Obx(()=> Text(
                                       '${profile_controller.nannyModel.value.gender==null?"":profile_controller.nannyModel.value.gender}',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Divider(thickness: 2,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price',
                                        style: GoogleFonts.raleway(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      ),
                                     Obx(()=> Text(
                                          '${profile_controller.nannyModel.value.price==null?"":profile_controller.nannyModel.value.price} Riyal (Per Hour)',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                        )
                    ],
                  ),
                ),
                      SizedBox(height: 10,),
                      Container(
                        width: sw,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 2,
                            blurRadius: 10,
                          )],
                          border: Border.all(width: 5,color: Colors.white,),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Obx(()=>Text(
                              '${profile_controller.nannyModel.value.address?.address==null?"":profile_controller.nannyModel.value.address?.address}',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              )
                            ),
                            ),
                            Divider(thickness: 2,),
                            Text(
                              'Education',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Obx(()=>Text(
                              '${profile_controller.nannyModel.value.education?.course==null?"":profile_controller.nannyModel.value.education?.course}${profile_controller.nannyModel.value.education?.course==null?"":","}${profile_controller.nannyModel.value.education?.university==null?"":profile_controller.nannyModel.value.education?.university}\n${profile_controller.nannyModel.value.education?.city==null?"":profile_controller.nannyModel.value.education?.city}',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              )),
                            ),
                            Divider(thickness: 2,),
                            Text(
                              'Experience',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Obx(()=>Text(
                              '${profile_controller.nannyModel.value.experience==null?"":profile_controller.nannyModel.value.experience}',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              )),
                            ),
                            Divider(thickness: 2,),
                            Text(
                              'Special Needs',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Obx(()=>Text(
                              '${profile_controller.nannyModel.value.special==true?"Yes":"No"} ',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              )),
                            ),
                            Divider(thickness: 2,),
                            Text(
                              'No. of Children Willing to care',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              '${profile_controller.nannyModel.value.children==null?"":profile_controller.nannyModel.value.children}',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            Divider(thickness: 2,),
                            Text(
                              'National Id',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Obx(()=>Text(
                              '${profile_controller.nannyModel.value.nic==null?"":profile_controller.nannyModel.value.nic}',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            )
                            ),
                            Divider(thickness: 2,),
                            Text(
                              'Sitter Type',
                              style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),
                            ),
                            SizedBox(height: 10,),
                            Obx(()=>Text(
                              '${profile_controller.nannyModel.value.type==null?"":profile_controller.nannyModel.value.type}',
                              maxLines: 10,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 14
                              ),)
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Image Gallery',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold ,
                                fontSize: 20
                            ),
                          ),
                          Visibility(
                            visible: profile_controller.nannyModel.value.gallery != null,
                            child: Container(
                              height: 100,
                              child: Obx(() => profile_controller.nannyModel.value.gallery!.isNotEmpty
                                  ? ListView.builder(
                                  itemCount: profile_controller.nannyModel.value.gallery !=
                                      null
                                      ? profile_controller.nannyModel.value.gallery!.length
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
                                                profile_controller.nannyModel.value.gallery!.length,
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
                                                                '${profile_controller.nannyModel.value.gallery!.elementAt(index)}'))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible:profile_controller.nannyModel.value.gallery!
                                                .length ==
                                                index + 1,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: InkWell(
                                                onTap: () async{
                                                  FilePickerResult? result = await FilePicker.platform
                                                      .pickFiles(
                                                      type: FileType.image, allowMultiple: false);
                                                  if (result != null) {
                                                    var file = result.files.single.path;
                                                    var name = result.files.single.name;
                                                    FirebaseStorage storage =
                                                        FirebaseStorage.instance;
                                                    Reference ref =
                                                    storage.ref().child('profile_images/');
                                                    await ref.putFile(File(file!));
                                                    var upload = await ref.getDownloadURL();
                                                    if (upload != null) {
                                                      FirebaseFirestore.instance.collection('nanny').doc(FirebaseAuth.instance.currentUser!.uid).update({
                                                        'gallery':FieldValue.arrayUnion([upload])
                                                      });
                                                      profile_controller.getProfileData();
                                                    }
                                                  } else {
                                                    // User canceled the picker
                                                  }
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
                                onTap: () async{
                                  FilePickerResult? result = await FilePicker.platform
                                      .pickFiles(
                                      type: FileType.image, allowMultiple: false);
                                  if (result != null) {
                                    var file = result.files.single.path;
                                    var name = result.files.single.name;
                                    FirebaseStorage storage =
                                        FirebaseStorage.instance;
                                    Reference ref =
                                    storage.ref().child('profile_images/');
                                    await ref.putFile(File(file!));
                                    var upload = await ref.getDownloadURL();
                                    if (upload != null) {
                                      FirebaseFirestore.instance.collection('nanny').doc(FirebaseAuth.instance.currentUser!.uid).update({
                                        'gallery':FieldValue.arrayUnion([upload])
                                      });
                                      profile_controller.getProfileData();
                                    }
                                  } else {
                                    // User canceled the picker
                                  }
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
                                  ],
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Availability',
                            style: GoogleFonts.raleway(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
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
                                                    '${profile_controller.nannyModel.value.availability!.elementAt(index).date}',
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

                                      },
                                      child: Icon(
                                        Icons.check_circle,
                                        size: 30,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                          : Container(),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          nanyFirebaseAuthController().signOut();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_signin_view()));
                        },
                        child: Container(
                          width: sw,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            boxShadow: [BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 10,
                            )],
                            border: Border.all(width: 5,color: Colors.white,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Logout',
                                maxLines: 10,
                                style: GoogleFonts.raleway(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),                      SizedBox(height: 10,),
                    ]),
            ),
        ),
      ),
    ]
    )));
  }
}
