import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/privacy_policy_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_booking_history_view.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';

class parent_drawer_view extends StatefulWidget {
 parent_drawer_view({Key,key}) : super(key: key);

  @override
  _parent_drawer_viewState createState() => _parent_drawer_viewState();
}

class _parent_drawer_viewState extends State<parent_drawer_view> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: Column(
        children: [
          Container(
            height: sh*0.25,
            width: sw,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,
                        color: Colors.white,),
                    ),
                    SizedBox(width: 10,)
                  ],
                ),
                SizedBox(height: sh*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 25,),
            Container(
            height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 2),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/lady.jpg'
                      )
                  )
              ),
            ),
                    SizedBox(width: 10,),
                    Text(
                      'Hi Shieanne,',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.bold ,
                          fontSize: 20
                      ),
                    ),
        ],
                ),
                SizedBox(height: 25,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=0;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Home',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=3;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'My Profile',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=11;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'My Child',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=6;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Booking History',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Text(
                    'About Us',
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold ,
                        fontSize: 14
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>privacy_policy_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Privacy Policy',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Text(
                    'Terms & Conditions',
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold ,
                        fontSize: 14
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Text(
                    'FAQ',
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold ,
                        fontSize: 14
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_signin_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Logout',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
