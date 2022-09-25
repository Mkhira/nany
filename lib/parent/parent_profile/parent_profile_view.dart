import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_profile/Controller/parentProfile_Controller.dart';

import '../auth_view/Controller/Auth_controller.dart';
import '../parent_drawer.dart/parent_drawer_view.dart';
class parent_profile_view extends StatefulWidget{
  parent_profile_view();

  @override
  State<parent_profile_view> createState() => _parent_profile_viewState();
}

class _parent_profile_viewState extends State<parent_profile_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final parentProfile_Controller profile_controller=Get.put(parentProfile_Controller());

  @override
  void initState() {
    profile_controller.getProfileData();
    // TODO: implement initState
    super.initState();
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
                                  parentFirebaseAuthController().signOut();
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              parent_signin_view()));
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
                padding: EdgeInsets.only(left: 30,right: 30,top: 30),
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
                                      '${profile_controller.parentModel.value.image}',
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
                                '${profile_controller.parentModel.value.fullname==null?"":profile_controller.parentModel.value.fullname}',
                                style: GoogleFonts.raleway(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              )),
                              Obx(()=> Text(
                                '${profile_controller.parentModel.value.address?.city==null?"":profile_controller.parentModel.value.address?.city}',
                                style: GoogleFonts.raleway(
                                    color:Colors.redAccent,
                                    fontSize: 12
                                ),
                              )),
                              SizedBox(height: 5,),
                              Container(
                                height: 30,
                                child: ElevatedButton(onPressed: (){
                                  parent_bottombar_viewState.selectedIndex=4;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
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
                                        '${profile_controller.parentModel.value.mobile==null?"":profile_controller.parentModel.value.mobile}',
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
                                        '${profile_controller.parentModel.value.email==null?"":profile_controller.parentModel.value.email}',
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
                                        '${profile_controller.parentModel.value.dob==null?"":profile_controller.parentModel.value.dob}',
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
                                        '${profile_controller.parentModel.value.gender==null?"":profile_controller.parentModel.value.gender}',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold ,
                                            fontSize: 14
                                        ),
                                      )),
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
                                '${profile_controller.parentModel.value.address?.address==null?"":profile_controller.parentModel.value.address?.address}',
                                maxLines: 10,
                                style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                )
                            ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      InkWell(
                        onTap: (){
                          parent_bottombar_viewState.selectedIndex=6;
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                        },
                        child: Container(
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
                                'Booking History',
                                maxLines: 10,
                                style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 14
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_signin_view()));
                        },
                        child: Container(
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
