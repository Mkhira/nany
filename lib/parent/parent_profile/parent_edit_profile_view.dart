import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/nanny_drawer.dart/nanny_drawer_view.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';

import '../../common/widget/ProgressPopUp.dart';
import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../parent_drawer.dart/parent_drawer_view.dart';
import 'Controller/parentProfile_Controller.dart';

class parent_edit_profile_view extends StatefulWidget{
  parent_edit_profile_view();

  @override
  State<parent_edit_profile_view> createState() => _parent_edit_profile_viewState();
}

class _parent_edit_profile_viewState extends State<parent_edit_profile_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  parentProfile_Controller profile_controller=Get.put(parentProfile_Controller());

  TextEditingController email=new TextEditingController();

  bool gender=false;

  bool special=false;

  var image;


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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        scaffoldkey.currentState!.openDrawer();
                                      },
                                      child: Icon(Icons.menu,size: 20,color: Colors.white,),
                                    ),
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
                      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      ),
                      child: SingleChildScrollView(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personal Information',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Full Name',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Obx(()=>TextField(
                                  onChanged: (value){
                                    profile_controller.parentModel.value.fullname=value;
                                  },
                                  decoration: InputDecoration(

                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText:'${profile_controller.parentModel.value.fullname==null?"":profile_controller.parentModel.value.fullname}',
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                )
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Upload Photo',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: InkWell(
                                  onTap: ()async{
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(type:FileType.image,allowMultiple: false);
                                    if(result != null) {
                                      var file = result.files.single.path;
                                      var name= result.files.single.name;
                                      FirebaseStorage storage = FirebaseStorage.instance;
                                      Reference ref = storage.ref('profile_images').child(result.files.single.name+FirebaseAuth.instance.currentUser!.uid);
                                      await ref.putFile(File(file!));
                                      var upload = await ref.getDownloadURL();
                                      if(upload!=null){
                                        profile_controller.parentModel.value.image=upload;
                                      }
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  child: Obx(()=>TextField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabled: false,
                                      hintText: '${profile_controller.parentModel.value.image==null?"":profile_controller.parentModel.value.image}',
                                      suffixIcon: Icon(Icons.upload_outlined,color: Colors.grey,),
                                      hintStyle: GoogleFonts.raleway(
                                          color:Colors.grey.shade400,
                                          fontWeight: FontWeight.w500,
                                          fontSize:16),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide(width: 1,color: Colors.grey),
                                      ),
                                      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                        borderSide: BorderSide(width: 1,color: Colors.grey),
                                      ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Date of Birth',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Obx(()=>TextField(
                                  onChanged: (value){
                                    profile_controller.parentModel.value.dob=value;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '${profile_controller.parentModel.value.dob==null?"":profile_controller.parentModel.value.dob}',
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                )),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Gender',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      setState(() {
                                        profile_controller.parentModel.value.gender='Male';
                                      });
                                    },
                                    child: Obx(()=>Container(
                                      height: 50,
                                      width: sw*0.43,
                                      decoration: BoxDecoration(
                                          color:  profile_controller.parentModel.value.gender=="Male"?Colors.green.shade500:Colors.white,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                          border: Border.all(width: 1,color: Colors.grey.shade400)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Male',
                                            style: GoogleFonts.raleway(
                                                color:profile_controller.parentModel.value.gender=="Male"?Colors.white:Colors.grey.shade400,
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ),
                                  InkWell(
                                    onTap: (){

                                      setState(() {
                                        profile_controller.parentModel.value.gender='Female';

                                      });
                                    },
                                    child: Obx(()=>Container(
                                      height: 50,
                                      width: sw*0.45,
                                      decoration: BoxDecoration(
                                          color:  profile_controller.parentModel.value.gender=="Female"?Colors.green:Colors.white,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight: Radius.circular(100)),
                                          border: Border.all(width: 1,color: Colors.grey.shade400)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [Text(
                                          'Female',
                                          style: GoogleFonts.raleway(
                                              color:profile_controller.parentModel.value.gender=="Female"?Colors.white:Colors.grey.shade400,
                                              fontSize: 14
                                          ),
                                        ),
                                        ],
                                      ),
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Address',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Address',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Obx(()=>TextField(
                                  onChanged: (value){
                                    profile_controller.parentModel.value.address?.address=value;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '${profile_controller.parentModel.value.address?.address==null?"":profile_controller.parentModel.value.address?.address}',
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                )),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'City',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child:Obx(()=> TextField(
                                  onChanged: (value){
                                    profile_controller.parentModel.value.address?.city=value;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '${profile_controller.parentModel.value.address?.city==null?"":profile_controller.parentModel.value.address?.city}',
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                )),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Phone / Email',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                'Phone Number',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Obx(()=>TextField(
                                  onChanged: (value){
                                    profile_controller.parentModel.value.mobile=value;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '${profile_controller.parentModel.value.mobile==null?"":profile_controller.parentModel.value.mobile}',
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                )),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Email',
                                style: GoogleFonts.raleway(
                                    color:Colors.grey,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                              Container(
                                height: 50,
                                child:Obx(()=> TextField(
                                  controller: email,
                                  onChanged: (value){
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '${profile_controller.parentModel.value.email==null?"":profile_controller.parentModel.value.email}',
                                    hintStyle: GoogleFonts.raleway(
                                        color:Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                        fontSize:16),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),
                                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                      borderSide: BorderSide(width: 1,color: Colors.grey),
                                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(150),
                                    borderSide: BorderSide(width: 1,color: Colors.grey),
                                  ),
                                  ),
                                ) ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: ElevatedButton(onPressed: (){
                                  CheckEmailUpdate().then((value) => {
                                    if(value==true){
                                      profile_controller.parentModel.value.email=email.text
                                    },
                                    print(profile_controller.parentModel.toJson()),
                                    ProgressPopup(context),
                                    profile_controller.UpdateProfile(profile_controller.parentModel.toJson()).then((value){
                                      parent_bottombar_viewState.selectedIndex=3;
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                    }),
                                  });
                                },
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))
                                    ),
                                    child:Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Submit',
                                              style: GoogleFonts.raleway(
                                                  color:Colors.white,
                                                  fontSize: 20
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 10,),
                            ],
                          )
                      ),
                    ),
                  ),
                ]
            )));
  }

  Future CheckEmailUpdate()async{
    if(email.text.isNotEmpty){
      print('aya');
      try{
        FirebaseAuth _auth = FirebaseAuth.instance;
        await _auth
            .signInWithEmailAndPassword( email: '${profile_controller.parentModel.value.email}',password: '${profile_controller.parentModel.value.password}')
            .then((userCredential) {
          userCredential.user!.updateEmail(email.text).then((value){
          });
        });
        return true;
      }catch(ex){
        return false;
      }
    }
  }
}
