import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/forget_password_otp_view.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/add_child/Controller/addChild_Controller.dart';
import 'package:nanny_co/parent/auth_view/Model/parentDataModel.dart';
import 'package:nanny_co/parent/search_view/Controller/parentSearch_Controller.dart';
import '../auth_view/parent_signup_view.dart';
import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import '../search_view/parent_search_view.dart';

class parent_add_child_view extends StatefulWidget{
  parent_add_child_view();

  @override
  State<parent_add_child_view> createState() => _parent_add_child_viewState();
}

class _parent_add_child_viewState extends State<parent_add_child_view> {
  parentChild_Controller child_controller=Get.put(parentChild_Controller());
  parentSearch_Controller search_controller=Get.put(parentSearch_Controller()
  );
  var selectedIndex=0;
  TextEditingController name=new TextEditingController();
  TextEditingController age=new TextEditingController();
  String image='';
  var special=false;
  var gender='Male';
  var height=40.0;
  GlobalKey<FormState> formKey=new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  parent_bottombar_viewState.selectedIndex=11;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                },
                                child: Icon(Icons.arrow_back,size: 20,color: Colors.white,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Child ',
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
                padding: EdgeInsets.only(left: 30,right: 30,top: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
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
                                'Child Information',
                                style: GoogleFonts.raleway(
                                    color:Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Child Name',
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
                            controller: name,
                            validator: (String? value) {
                              if (value == '') {
                                return 'Please fillout this field';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintStyle:GoogleFonts.raleway(
                                  color: Colors.grey.shade400,
                                  fontSize: 14
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(height: 10,),
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
                            FilePickerResult? result = await FilePicker.platform.pickFiles(type:FileType.image,allowMultiple: false);
                            if(result != null) {
                              ProgressPopup(context);
                              var file = result.files.single.path;
                              var name= result.files.single.name;
                              FirebaseStorage storage = FirebaseStorage.instance;
                              Reference ref = storage.ref('child_images').child(result.files.single.name+FirebaseAuth.instance.currentUser!.uid);
                              await ref.putFile(File(file!));
                              var upload = await ref.getDownloadURL();
                              if(upload!=null){
                                image=upload;
                              }
                              Navigator.pop(context);
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(height: 50,width: sw,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade400,width: 1)
                            ),child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [ Icon(Icons.upload_outlined,color: Colors.grey,size: 20,),],),),
                          )
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Child\'s Age',
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
                            controller: age,
                            validator: (String? value) {
                              if (value == '') {
                                return 'Please fillout this field';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintStyle:GoogleFonts.raleway(
                                  color: Colors.grey.shade400,
                                  fontSize: 14
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Special Child',
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
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: special?Colors.green:Colors.transparent,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                        border: Border.all(width: 1,color: Colors.grey.shade400)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Yes',
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
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: !special?Colors.green:Colors.transparent,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                        border: Border.all(width: 1,color: Colors.grey.shade400)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [Text(
                                        'No',
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
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Gender',
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
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: gender=='Male'?Colors.green:Colors.transparent,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                        border: Border.all(width: 1,color: Colors.grey.shade400)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Male',
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
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: gender=='Female'?Colors.green:Colors.transparent,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                        border: Border.all(width: 1,color: Colors.grey.shade400)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [Text(
                                        'Female',
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
                        SizedBox(height: 50,),
                        Container(

                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(onPressed: (){
                            if(formKey.currentState!.validate()){
                              print('aya');
                              if(image.isNotEmpty && image!=''){
                              ProgressPopup(context);
                              Children child=new Children(
                                image: image,
                                gender: gender,
                                name: name.text,
                                special: special,
                                age: age.text,
                              );
                              child_controller.addChild(
                                child.toJson()
                              ).then((value) => {
                                Navigator.pop(context),
                              AnimatedSnackBar.material(
                              'Child Added',
                              type: AnimatedSnackBarType.success,
                              ).show(context),
                              });
                              search_controller.getProfileData();
                              }else{
                              AnimatedSnackBar.material(
                                'Please Input Image',
                                type: AnimatedSnackBarType.error,
                              ).show(context);
                            }
                            }else{
                              setState(() {
                                height=50;
                              });
                            }
                          },
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))
                              ),
                              child:Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                child: Center(
                                  child: Text(
                                    'Save Child',
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
    );
  }
}
