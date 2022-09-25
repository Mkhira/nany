import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanny_co/nany/nanny_booking_view/nanny_booking_detail_view.dart';
import 'package:nanny_co/nany/nanny_booking_view/nanny_booking_history_view.dart';
import 'package:nanny_co/nany/nanny_profile/nanny_edit_profile_view.dart';
import 'package:nanny_co/nany/nanny_profile/nanny_profile_view.dart';
import 'package:nanny_co/nany/nanny_wallet_view/nanny_wallet_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signup_view.dart';
import 'package:nanny_co/parent/gallery_view/parent_gallery_view.dart';
import 'package:nanny_co/parent/parent_profile/parent_profile_view.dart';
import 'package:nanny_co/parent/search_view/parent_search_view.dart';

import '../nanny_booking_view/nanny_home_view.dart';

class nanny_bottombar_view extends StatefulWidget {
  const nanny_bottombar_view({Key,key}) : super(key: key);

  @override
  nanny_bottombar_viewState createState() => nanny_bottombar_viewState();
}

class nanny_bottombar_viewState extends State<nanny_bottombar_view> {
  static var selectedIndex=0;
  List pages=[
    nanny_home_view(),
    nanny_booking_history_view(),
    nanny_wallet_view(),
    nanny_profile_view(),
    nanny_edit_profile_view(),
    nanny_booking_detail_view(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.all(5),
            child: Icon(CupertinoIcons.home,color: selectedIndex==0?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedIndex==0?Theme.of(context).primaryColor:Colors.white10
          ),),label: 'search'),
          BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.all(5),
            child: Icon(FontAwesomeIcons.book,color: selectedIndex==1?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex==1?Theme.of(context).primaryColor:Colors.white10
          ),),label: 'search'),

          BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.all(5),
            child: Icon(FontAwesomeIcons.wallet,color: selectedIndex==2?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex==2?Theme.of(context).primaryColor:Colors.white10
          ),),label: 'search'),

          BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.person,color: selectedIndex==3?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex==3?Theme.of(context).primaryColor:Colors.white10
          ),),label: 'search'),
        ],
      ),
      body:pages.elementAt(selectedIndex) ,
    );
  }
}
