import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class parentFirebaseAuthController {
  fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword(String email, String password,context) async {
    try {
      fba.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        SharedPreferences.getInstance().then((value) => {
          value.setBool('nanny',false),
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
                  Flexible(child: Text('Incorrect email or password',style:TextStyle(color: Colors.white),)),
                ],
              ),
            ),
          );
        }),
      ).show(context);
      return false;
    }
  }
  Future<bool> signUpWithEmailAndPassword(String email, String password,context) async {
    try{
    fba.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (result.user != null) {
      return true;
    } else {
      return false;
    }
    }catch(ex){
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text('${ex.toString().replaceAll('[firebase_auth/email-already-in-use] ', '')}',style:TextStyle(color: Colors.white),)),
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
