import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/add_child/parent_add_child_view.dart';
import 'package:nanny_co/parent/add_child/parent_children_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/forget_password_otp_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import '../parent/auth_view/parent_signup_view.dart';
import '../parent/search_view/parent_search_view.dart';
class privacy_policy_view extends StatefulWidget{
  privacy_policy_view();

  @override
  State<privacy_policy_view> createState() => _privacy_policy_viewState();
}

class _privacy_policy_viewState extends State<privacy_policy_view> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  var text="Privacy is not a new concept. Humans have always desired privacy in their social as well as private lives. But the idea of privacy as a human right is a relatively modern phenomenon. Around the world, laws and regulations have been developed for the protection of data related to government, education, health, children, consumers, financial institutions, etc. This data is critical to the person it belongs to. From credit card numbers and social security numbers to email addresses and phone numbers, our sensitive, personally identifiable information is important. This sort of information in unreliable hands can potentially have far-reaching consequences. Companies or websites that handle customer information are required to publish their Privacy Policies on their business websites. If you own a website, web app, mobile app or desktop app that collects or processes user data, you most certainly will have to post a Privacy Policy on your website (or give in-app access to the full Privacy Policy agreement). There are several reasons for a website to post its Privacy Policy agreement on its website.";
  var selectedIndex=0;
  List pages=[
    parent_search_view(),
    parent_signup_view(),
    parent_signup_view(),
    parent_signup_view()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
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
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.arrow_back,size: 20,color: Colors.white,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Privacy Policy ',
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Privacy Policy',
                                style: GoogleFonts.raleway(
                                    color:Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold ,
                                    fontSize: 20
                                ),
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            '$text',
                            maxLines: 10000,
                            style: GoogleFonts.raleway(
                                color:Colors.grey,
                                fontSize: 14
                            ),
                          ),
                        ),
                      ],
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
