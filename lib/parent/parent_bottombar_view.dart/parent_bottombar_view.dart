import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signup_view.dart';
import 'package:nanny_co/parent/gallery_view/parent_gallery_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_book_nanny.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_booking_confirmation_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_booking_history_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_confirmed_booking_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_nanny_details.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_sitting_started_view.dart';
import 'package:nanny_co/parent/parent_profile/parent_edit_profile_view.dart';
import 'package:nanny_co/parent/parent_profile/parent_profile_view.dart';
import 'package:nanny_co/parent/search_view/parent_search_result.dart';
import 'package:nanny_co/parent/search_view/parent_search_view.dart';

import '../favourite_nanny/parent_favourite_nanny.dart';

class parent_bottombar_view extends StatefulWidget {
  const parent_bottombar_view({Key,key}) : super(key: key);

  @override
  parent_bottombar_viewState createState() => parent_bottombar_viewState();
}

class parent_bottombar_viewState extends State<parent_bottombar_view> {
 static var selectedIndex=0;
  List pages=[
    parent_search_view(),//0
    parent_booking_history_view(),//1
    parent_favourite_nanny(),//2
    parent_profile_view(),//3
    parent_edit_profile_view(),//4
    parent_book_nany_view(),//5
    parent_booking_history_view(),//6
    parent_booking_confirmation_view(),//7
    parent_booking_confirmed_view(),//8
    parent_sitting_started_view(),//9
    parent_add_child_view(),//10
    parent_children_view(),//11
    parent_search_result(),//12
    parent_nany_detail_view(),//13
    parent_gallery_view()//14
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
            child: Icon(CupertinoIcons.search,color: selectedIndex==0?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedIndex==0?Theme.of(context).primaryColor:Colors.white10
          ),),label: 'search'),
          BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.all(5),
            child: Icon(FontAwesomeIcons.solidFaceSmile,color: selectedIndex==1?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex==1?Theme.of(context).primaryColor:Colors.white10
          ),),label: 'search'),

          BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.all(5),
            child: Icon(FontAwesomeIcons.solidHeart,color: selectedIndex==2?Colors.white:Theme.of(context).primaryColor,),decoration: BoxDecoration(
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
