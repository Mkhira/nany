import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/gallery_view/parent_gallery_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_drawer.dart/parent_drawer_view.dart';

class parent_sitting_started_view extends StatefulWidget {
  parent_sitting_started_view();

  @override
  State<parent_sitting_started_view> createState() => _parent_sitting_started_viewState();
}

class _parent_sitting_started_viewState extends State<parent_sitting_started_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  List images = [
    'https://images.pexels.com/photos/1556691/pexels-photo-1556691.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.ctfassets.net/hrltx12pl8hq/5GaLeZJlLyOiQC4gOA0qUM/a0398c237e9744ade8b072f99349e07a/shutterstock_152461202_thumb.jpg?fit=fill&w=480&h=270'
  ];

  RangeValues _currentRangeValues = const RangeValues(1, 100);

  var check=true;

  bool canceled=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: parent_drawer_view(),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    parent_bottombar_viewState.selectedIndex=8;
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
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
                                  'Booking Confirm ',
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
                  height: sh * 0.7,
                  width: sw,
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
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Visit Schedule',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Entry Time',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ), Text(
                                          '09:00 Am',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Exit Time',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ), Text(
                                          '06:00 Pm',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                   Icon(Icons.circle,color: Colors.green,),
                                    Expanded(
                                      child: Container(height: 1,color: Colors.grey,),
                                    ),
                                    Icon(Icons.circle,color: Colors.green,),
                                  ],
                                ),
                                SizedBox(height: 10,),

                              ],
                            ),
                          ),
                          Container(
                            height: 180,
                            width: sw,
                            margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/childmom.jpg')),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 1,
                                    blurRadius: 5)
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: sw,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Aliyah Wang',
                                            style: GoogleFonts.raleway(
                                                color:
                                                Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '1.5 KM',
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          RatingBar(
                                            glow: false,
                                            updateOnDrag: false,
                                            initialRating: 4,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 20,
                                            ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star,
                                                color: Colors.orange.shade800,
                                              ),
                                              half: Icon(
                                                Icons.star,
                                                color: Colors.orange.shade800,
                                              ),
                                              empty: Icon(
                                                Icons.star_border_outlined,
                                                color: Colors.orange.shade800,
                                              ),
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '50 Riyal',
                                            style: GoogleFonts.raleway(
                                                color:
                                                Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Per Hour',
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ).asGlass(
                                    blurX: 20,
                                    blurY: 20,
                                    tintColor: Colors.white,
                                    clipBorderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height:20,),
                                Text(
                                  'Children\'s Detail',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Column(
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
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/images/child1.jpg'
                                                    )
                                                )
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          'Adam, 6',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold ,
                                              fontSize: 14
                                          ),
                                        ),
                                        Text(
                                          'Boy',
                                          style: GoogleFonts.raleway(
                                              color:Colors.redAccent,
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      children: [
                                        Container(
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
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/images/child2.jpg'
                                                    )
                                                )
                                            ),
                                          ),
                                        ),                               SizedBox(height: 5,),
                                        Text(
                                          'Amber, 6',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold ,
                                              fontSize: 14
                                          ),
                                        ),
                                        Text(
                                          'Girl',
                                          style: GoogleFonts.raleway(
                                              color:Colors.redAccent,
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  'Talk to Nanny',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                      },
                                      child: Container(
                                        height: 50,
                                        width: sw*0.43,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                            border: Border.all(width: 1,color: Colors.grey.shade400)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(CupertinoIcons.chat_bubble_2_fill,color: Theme.of(context).primaryColor,size: 30,)
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                      },
                                      child: Container(
                                        height: 50,
                                        width: sw*0.45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(100),bottomRight: Radius.circular(100)),
                                            border: Border.all(width: 1,color: Colors.grey.shade400)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [                                           Icon(CupertinoIcons.device_phone_portrait,color: Theme.of(context).primaryColor,size: 30,)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text(
                                      'Status  ',
                                      style: GoogleFonts.raleway(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 16
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(height: 1,color: Colors.grey,),
                                    ),
                                    Text(
                                      '  Sitting started',
                                      style: GoogleFonts.raleway(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold ,
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ])));
  }
}
