import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';
import 'package:nanny_co/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NanyAuthController {
  final fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword(String email, String password, context) async {
    try {
      fba.UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        SharedPreferences.getInstance().then((value) => {
              value.setBool('nanny', true),
            });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      AnimatedSnackBar(
        builder: ((context) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    'Incorrect email or password'.translate(),
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
          );
        }),
      ).show(context);
      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password, context) async {
    try {
      fba.UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      AnimatedSnackBar(
        builder: ((context) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            child: Center(
              child: Row(
                children: [
                  Flexible(
                      child: Text(
                    ex.toString().replaceAll('[firebase_auth/email-already-in-use] ', ''),
                    style: const TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
          );
        }),
      ).show(context);
      return false;
    }
  }

  Future signOut() async {
    return await _auth.signOut();
  }
}
