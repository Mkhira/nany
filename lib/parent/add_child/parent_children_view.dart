import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/Controller/addChild_Controller.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';

import '../search_view/Controller/parentSearch_Controller.dart';
class ParentChildrenView extends StatefulWidget{
  const ParentChildrenView({Key? key}) : super(key: key);

  @override
  State<ParentChildrenView> createState() => _ParentChildrenViewState();
}

class _ParentChildrenViewState extends State<ParentChildrenView> {
  var selectedIndex=0;
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();
  parentSearch_Controller searchController=Get.put(parentSearch_Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // search_controller.getProfileData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(onPressed: (){
        parent_bottombar_viewState.selectedIndex=10;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ParentAddChildView()));
      },backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
    ),
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
                                  parent_bottombar_viewState.selectedIndex=0;
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
                                'Children ',
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
                      const SizedBox(height: 20,),
                      SizedBox(height:sh*0.61,
                       child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 100,
                                childAspectRatio:0.7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemCount:searchController.parentModel.value.children!=null?searchController.parentModel.value.children!.length+1:1,
                            itemBuilder: (BuildContext ctx, index) {
                              return index<searchController.parentModel.value.children!.length? searchController.parentModel.value.children!.isNotEmpty ?
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible:index<=searchController.parentModel.value.children!.length,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              const SizedBox(height: 10,),
                                              Container(
                                                padding: const EdgeInsets.all(5),
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
                                                              '${searchController.parentModel.value.children!.elementAt(index).image}'
                                                          )
                                                      )
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5,),
                                              Obx(()=>Text(
                                                '${searchController.parentModel.value.children!.elementAt(index).name}',
                                                style: GoogleFonts.raleway(
                                                    color: Theme.of(context).primaryColor,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 14
                                                ),)
                                              ),
                                              Obx(()=>  Text(
                                                '${searchController.parentModel.value.children!.elementAt(index).gender}',
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
                                                              const SizedBox(
                                                                height: 23,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    padding: const EdgeInsets.all(5),
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
                                                                                  '${searchController.parentModel.value.children!.elementAt(index).image}'
                                                                              )
                                                                          )
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(width: 5,),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Obx(()=>Text(
                                                                        '${searchController.parentModel.value.children!.elementAt(index).name}',
                                                                        style: GoogleFonts.raleway(
                                                                            color: Theme.of(context).primaryColor,
                                                                            fontWeight: FontWeight.bold ,
                                                                            fontSize: 14
                                                                        ),)
                                                                      ),
                                                                      Obx(()=>  Text(
                                                                        '${searchController.parentModel.value.children!.elementAt(index).gender}',
                                                                        style: GoogleFonts.raleway(
                                                                            color:Colors.redAccent,
                                                                            fontSize: 12
                                                                        ),
                                                                      )),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
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
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "You want to delete Child?",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                              const SizedBox(
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
                                                                                parentChild_Controller().removeChild(searchController.parentModel.value.children!.elementAt(index).toJson()).then((value)
                                                                                {
                                                                                  // search_controller.getProfileData();
                                                                                });
                                                                              });
                                                                              parent_bottombar_viewState.selectedIndex=0;
                                                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const parent_bottombar_view()));
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
                                                                            const Icon(
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
                                          },child: const Icon(Icons.cancel,size: 30,color: Colors.redAccent,)),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ):
                              InkWell(
                                onTap: (){
                                  parent_bottombar_viewState.selectedIndex=11;
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const parent_bottombar_view()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: 75,
                                        width: 75,
                                        padding: const EdgeInsets.all(5),
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
                                        child: const Center(
                                          child: Icon(Icons.add,color: Colors.grey,),
                                        )
                                    ),
                                    const SizedBox(height: 5,),
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
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const parent_bottombar_view()));
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10,),
                                    Container(
                                        height: 75,
                                        width: 75,
                                        padding: const EdgeInsets.all(5),
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
                                        child: const Center(
                                          child: Icon(Icons.add,color: Colors.grey,),
                                        )
                                    ),
                                    const SizedBox(height: 5,),
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
