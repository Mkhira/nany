import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/Controller/addChild_Controller.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';

import '../auth_view/parent_signup_view.dart';
import '../search_view/Controller/parentSearch_Controller.dart';
import '../search_view/parent_search_view.dart';
class parent_children_view extends StatefulWidget{
  parent_children_view();

  @override
  State<parent_children_view> createState() => _parent_children_viewState();
}

class _parent_children_viewState extends State<parent_children_view> {
  var selectedIndex=0;
  GlobalKey<ScaffoldState> scaffoldkey=new GlobalKey();
  parentSearch_Controller search_controller=Get.put(parentSearch_Controller());
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
                                  parent_bottombar_viewState.selectedIndex=0;
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
                                'Children ',
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
                      Text(
                        'Children\'s',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold ,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(height:sh*0.61,
                       child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 100,
                                childAspectRatio:0.7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemCount:search_controller.parentModel.value.children!=null?search_controller.parentModel.value.children!.length+1:1,
                            itemBuilder: (BuildContext ctx, index) {
                              return index<search_controller.parentModel.value.children!.length? search_controller.parentModel.value.children!.isNotEmpty ?
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible:index<=search_controller.parentModel.value.children!.length,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,  boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey.shade300,
                                                      spreadRadius: 3,
                                                      blurRadius: 5
                                                  )
                                                ]
                                                ),
                                                child: Container(
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              '${search_controller.parentModel.value.children!.elementAt(index).image}'
                                                          )
                                                      )
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Obx(()=>Text(
                                                '${search_controller.parentModel.value.children!.elementAt(index).name}',
                                                style: GoogleFonts.raleway(
                                                    color: Theme.of(context).primaryColor,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 14
                                                ),)
                                              ),
                                              Obx(()=>  Text(
                                                '${search_controller.parentModel.value.children!.elementAt(index).gender}',
                                                style: GoogleFonts.raleway(
                                                    color:Colors.redAccent,
                                                    fontSize: 12
                                                ),
                                              )),
                                            ],
                                          ),
                                          Positioned(right: 0,child: InkWell(onTap:(){
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                      child: Container(
                                                        height: 200,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(20),
                                                        ),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                height: 23,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.all(5),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: Colors.white,  boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors.grey.shade300,
                                                                          spreadRadius: 3,
                                                                          blurRadius: 5
                                                                      )
                                                                    ]
                                                                    ),
                                                                    child: Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.fill,
                                                                              image: NetworkImage(
                                                                                  '${search_controller.parentModel.value.children!.elementAt(index).image}'
                                                                              )
                                                                          )
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 5,),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Obx(()=>Text(
                                                                        '${search_controller.parentModel.value.children!.elementAt(index).name}',
                                                                        style: GoogleFonts.raleway(
                                                                            color: Theme.of(context).primaryColor,
                                                                            fontWeight: FontWeight.bold ,
                                                                            fontSize: 14
                                                                        ),)
                                                                      ),
                                                                      Obx(()=>  Text(
                                                                        '${search_controller.parentModel.value.children!.elementAt(index).gender}',
                                                                        style: GoogleFonts.raleway(
                                                                            color:Colors.redAccent,
                                                                            fontSize: 12
                                                                        ),
                                                                      )),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "Are you sure?",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize: 15,
                                                                    color: Theme.of(context).primaryColor,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "You want to delete Child?",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Container(
                                                                height: 1,
                                                                width:
                                                                MediaQuery.of(context)
                                                                    .size
                                                                    .width,
                                                                color: Colors.grey,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:(){
                                                                              setState(() {
                                                                                parentChild_Controller().removeChild(search_controller.parentModel.value.children!.elementAt(index).toJson()).then((value)
                                                                                {
                                                                                  search_controller.getProfileData();
                                                                                });
                                                                              });
                                                                              parent_bottombar_viewState.selectedIndex=0;
                                                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                                                              },
                                                                            child: Center(
                                                                                child: Text(
                                                                                  "✔ yes",
                                                                                  style: GoogleFonts
                                                                                      .raleway(
                                                                                      color: Colors
                                                                                          .green,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .bold),
                                                                                )),
                                                                          )
                                                                        ],
                                                                      )),
                                                                  Container(
                                                                    height: 60,
                                                                    width: 1,
                                                                    color: Colors.grey,
                                                                  ),
                                                                  Expanded(
                                                                      child: InkWell(
                                                                        onTap: (){
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.close,
                                                                              color: Colors.red,
                                                                              size: 20,
                                                                            ),
                                                                            Text(
                                                                              "No",
                                                                              style: GoogleFonts
                                                                                  .raleway(
                                                                                  color: Colors
                                                                                      .red,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ));
                                                });
                                          },child: Icon(Icons.cancel,size: 30,color: Colors.redAccent,)),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ):InkWell(
                                onTap: (){
                                  parent_bottombar_viewState.selectedIndex=11;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: 75,
                                        width: 75,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  spreadRadius: 3,
                                                  blurRadius: 5
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add,color: Colors.grey,),
                                        )
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      'Add Child',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 14
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: GoogleFonts.raleway(
                                          color:Colors.redAccent,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                              ):InkWell(
                                onTap: (){
                                  parent_bottombar_viewState.selectedIndex=10;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Container(
                                        height: 75,
                                        width: 75,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  spreadRadius: 3,
                                                  blurRadius: 5
                                              )
                                            ]
                                        ),
                                        child: Center(
                                          child: Icon(Icons.add,color: Colors.grey,),
                                        )
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      'Add Child',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 14
                                      ),
                                    ),
                                    Text(
                                      '',
                                      style: GoogleFonts.raleway(
                                          color:Colors.redAccent,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                              );

                            }),
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
