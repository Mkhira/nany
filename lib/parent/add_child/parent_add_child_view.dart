import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/forget_password_otp_view.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/add_child/Controller/addChild_Controller.dart';
import 'package:nanny_co/parent/add_child/Controller/add_child_cubit.dart';
import 'package:nanny_co/parent/auth_view/Model/parentDataModel.dart';
import 'package:nanny_co/parent/search_view/Controller/parentSearch_Controller.dart';
import '../auth_view/parent_signup_view.dart';
import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../search_view/parent_search_view.dart';

class ParentAddChildView extends StatefulWidget{
  const ParentAddChildView({Key? key}) : super(key: key);

  @override
  State<ParentAddChildView> createState() => _ParentAddChildViewState();
}

class _ParentAddChildViewState extends State<ParentAddChildView> {
  parentChild_Controller childController=Get.put(parentChild_Controller());
  parentSearch_Controller searchController=Get.put(parentSearch_Controller()
  );
  var selectedIndex=0;
  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  String image='';
  var special=false;
  var gender='Male';
  var height=40.0;
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddChildCubit,AddChildState>(builder: (context,state)=> Scaffold(
      body: SizedBox(
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
                                  parent_bottombar_viewState.selectedIndex=11;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const parent_bottombar_view()));
                                },
                                child: const Icon(Icons.arrow_back,size: 20,color: Colors.white,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Child'.translate(),
                                style: GoogleFonts.raleway(
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),
                              const Image(image:AssetImage('assets/images/dots.png')),
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
                padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Child Information'.translate(),
                                  style: GoogleFonts.raleway(
                                      color:Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: 20
                                  ),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Child Name'.translate(),
                                  style: GoogleFonts.raleway(
                                      color:Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller:                                         injector.get<AddChildCubit>().name,
                              validator: (String? value) {
                                if (value == '') {
                                  return 'Please fill out this field'.translate();
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintStyle:GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontSize: 14
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                                disabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Upload Child Photo',
                                  style: GoogleFonts.raleway(
                                      color:Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: ()async{
                                FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
                                if (result != null) {
                                  // profileController.parentModel.value.image=upload;
                                  injector.get<AddChildCubit>().getImage(File(result.files.single.path!));
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Container(height: 50,width: sw,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey.shade400,width: 1)
                                  ),child: Row(mainAxisAlignment: MainAxisAlignment.end,children: const [ Icon(Icons.upload_outlined,color: Colors.grey,size: 20,),],),),
                              )
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Childs Age'.translate(),
                                  style: GoogleFonts.raleway(
                                      color:Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller:                                         injector.get<AddChildCubit>().age,
                              validator: (String? value) {
                                if (value == '') {
                                  return 'Please fill out this field'.translate();
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle:GoogleFonts.raleway(
                                    color: Colors.grey.shade400,
                                    fontSize: 14
                                ),

                                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                                enabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                                disabledBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Special Child'.translate(),
                                  style: GoogleFonts.raleway(
                                      color:Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap:(){
                                      setState(() {
                                        special=true;
                                        injector.get<AddChildCubit>().specialNeed = special?'Yes':'No';

                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: special?Colors.green:Colors.transparent,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                          border: Border.all(width: 1,color: Colors.grey.shade400)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Yes'.translate(),
                                            style: GoogleFonts.raleway(
                                                color:special?Colors.white:Theme.of(context).primaryColor,
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        special=false;
                                        injector.get<AddChildCubit>().specialNeed = special?'Yes':'No';

                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: !special?Colors.green:Colors.transparent,
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                          border: Border.all(width: 1,color: Colors.grey.shade400)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [Text(
                                          'No'.translate(),
                                          style: GoogleFonts.raleway(
                                              color:!special?Colors.white:Theme.of(context).primaryColor,
                                              fontSize: 14
                                          ),
                                        ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Gender'.translate(),
                                  style: GoogleFonts.raleway(
                                      color:Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap:(){
                                      setState(() {
                                        gender='Male';
                                        injector.get<AddChildCubit>().gander = gender;
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: gender=='Male'?Colors.green:Colors.transparent,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                          border: Border.all(width: 1,color: Colors.grey.shade400)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Male'.translate(),
                                            style: GoogleFonts.raleway(
                                                color:gender=='Male'?Colors.white:Theme.of(context).primaryColor,
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        gender='Female';
                                        injector.get<AddChildCubit>().gander = gender;

                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: gender=='Female'?Colors.green:Colors.transparent,
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                          border: Border.all(width: 1,color: Colors.grey.shade400)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [Text(
                                          'Female'.translate(),
                                          style: GoogleFonts.raleway(
                                              color:gender=='Female'?Colors.white:Theme.of(context).primaryColor,
                                              fontSize: 14
                                          ),
                                        ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 50,),
                          Container(

                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(onPressed: ()async{

                             bool added =await injector.get<AddChildCubit>().addChild();
                             if(added){

                               parent_bottombar_viewState.selectedIndex=11;
                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> parent_bottombar_view()));

                             }

                            },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      'Save Child'.translate(),
                                      style: GoogleFonts.raleway(
                                          color:Colors.white,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
