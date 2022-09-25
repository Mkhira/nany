import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanny_co/common/role_selection_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/onboarding/onboarding_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_view extends StatefulWidget {
  const splash_view({Key, key}) : super(key: key);

  @override
  _splash_viewState createState() => _splash_viewState();
}

class _splash_viewState extends State<splash_view> {
  var chk;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(Duration(milliseconds: 800)).then((value) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => onboarding_view(),
          ));
        });
      } else {
        SharedPreferences.getInstance().then((value) {
          chk = value.getBool("nanny");
          if (chk == true && chk != null) {
            Future.delayed(Duration(milliseconds: 800)).then((value) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nanny_bottombar_view()));
            });
          } else if (chk == false && chk != null) {
            Future.delayed(Duration(milliseconds: 800)).then((value) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => parent_bottombar_view()));
            });
          } else {
            Future.delayed(Duration(milliseconds: 800)).then((value) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => onboarding_view(),
              ));
            });
          }
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sw = MediaQuery.of(context).size.width;
    sh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: sh,
        width: sw,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/Group 723.png'))),
      ),
    );
  }
}
