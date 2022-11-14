import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanny_co/common/role_selection_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/onboarding/onboarding_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key, key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var chk;

  getTokens() async {
    String? fireBaseToken;
    String? deviceID;
    await FirebaseMessaging.instance.getToken().then((value) => fireBaseToken = value);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceID = androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceID = iosInfo.identifierForVendor;
    }

    SettingsProvider.current.saveTokens(deviceToken: deviceID, fireBaseToken: fireBaseToken);

    log('Token:  ${SettingsProvider.userData.jwtToken}',);
  }

  @override
  void initState() {
    getTokens();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(Duration(milliseconds: 800)).then((value) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
            if (SettingsProvider.current.appSettings.isFirstTime) {
              return OnboardingView();
            } else {
              if (SettingsProvider.current.appSettings.isLogin) {
                if (SettingsProvider.current.appSettings.userData?.appType == 'parent') {
                  return parent_bottombar_view();
                } else {
                  return nanny_bottombar_view();
                }
              } else {
                return role_selection_view();
              }
            }
          }));
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
                builder: (context) => OnboardingView(),
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
