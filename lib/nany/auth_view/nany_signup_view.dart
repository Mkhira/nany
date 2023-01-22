import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/Model/nannyDataModel.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/auth_view/verify.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';

import '../nanny_bottombar_view/nanny_bottombar_view.dart';
import 'nany_signin_view.dart';

class NannySignupView extends StatefulWidget {
  const NannySignupView({Key, key}) : super(key: key);

  @override
  _NannySignupViewState createState() => _NannySignupViewState();
}

class _NannySignupViewState extends State<NannySignupView> {
  var obscure = true;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  String type = 'sitter';
  double height = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: sh,
          width: sw,
          child: Stack(
            children: [
              Container(
                height: sh * 0.3,
                width: sw,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Container(
                    height: sh * 0.15,
                    width: sw * 0.5,
                    decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/logo/logo.png'))),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: sh * 0.76,
                  width: sw,
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Register Now for Nanny'.translate(),
                            style: GoogleFonts.raleway(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please enter details to continue.'.translate(),
                            style: GoogleFonts.raleway(color: Colors.grey.shade400, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldNany(
                            height: height,
                            controller: fullName,
                            hintText: 'Full Name'.translate(),
                            validation: (String? value) {
                              if (value == '') {
                                return 'Please fill out this field'.translate();
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldNany(
                            height: height,
                            hintText: 'Enter Username'.translate(),
                            validation: (String? value) {
                              if (value == '') {
                                return 'Please fill out this field'.translate();
                              } else {
                                return null;
                              }
                            },
                            controller: userName,
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldNany(
                            height: height,
                            hintText: 'Password'.translate(),
                            obsecure: obscure,
                            controller: password,
                            validation: (String? value) {
                              if (value == '') {
                                return 'Please fill out this field'.translate();
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey.shade400,
                                  size: 20,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldNany(
                            height: height,
                            hintText: 'Confirm Password'.translate(),
                            controller: confirmPassword,
                            obsecure: obscure,
                            validation: (String? value) {
                              if (value == '') {
                                return 'Please fill out this field'.translate();
                              } else if (value != password.text) {
                                return 'Password dont match'.translate();
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey.shade400,
                                  size: 20,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldNany(
                              height: height,

                              validation: (String? value) {
                                if (value == '') {
                                  return 'Please fill out this field'.translate();
                                } else {
                                  return null;
                                }
                              },
                              hintText: 'Phone'.translate(),
                              controller: phone,

                              suffixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.grey.shade400,
                                size: 20,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldNany(
                            height: height,
                            hintText: 'Email Address'.translate(),
                            controller: email,
                            validation: (String? value) {
                              if (value == '') {
                                return 'Please fill out this field'.translate();
                              } else if (!value!.contains('@')) {
                                return 'Please enter valid email address';
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.alternate_email,
                                  color: Colors.grey.shade400,
                                  size: 20,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(

                              children: [
                                SizedBox(
                                  height: 50,

                                  width: MediaQuery.of(context).size.width/2-5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        injector.get<AuthCubit>().sitterType =
                                        'Home Sitter';
                                      });
                                    },
                                    child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Home Sitter'.translate(),
                                        enabled: false,
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        prefixIcon: InkWell(
                                          onTap: () {
                                            setState(() {

                                              injector.get<AuthCubit>().sitterType  = 'Home Sitter';
                                            });
                                          },
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color:  injector.get<AuthCubit>().sitterType ==
                                                    "Home Sitter"
                                                    ? Colors.green
                                                    : Colors.white,
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft: Radius.circular(15),
                                                    topLeft: Radius.circular(15)),
                                                border: Border.all(
                                                    color: Colors.grey, width: 1)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.check,
                                                    color:  injector.get<AuthCubit>().sitterType ==
                                                        "Home Sitter"
                                                        ? Colors.white
                                                        : Colors.grey.shade400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        hintStyle: GoogleFonts.raleway(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
SizedBox(width: 10,),
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width/2-5,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        injector.get<AuthCubit>().sitterType =
                                        'Goto Sitter';
                                      });
                                    },
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabled: false,
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Goto Sitter'.translate(),
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        prefixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              injector.get<AuthCubit>().sitterType = 'Goto Sitter';
                                            });
                                          },
                                          child:  Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color:  injector.get<AuthCubit>().sitterType ==
                                                    "Goto Sitter"
                                                    ? Colors.green
                                                    : Colors.white,
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(15),
                                                    topLeft:
                                                    Radius.circular(15)),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.check,
                                                    color:  injector.get<AuthCubit>().sitterType ==
                                                        "Goto Sitter"
                                                        ? Colors.white
                                                        : Colors.grey.shade400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        hintStyle: GoogleFonts.raleway(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'Lesson type',
                            style: GoogleFonts.raleway(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    injector.get<AuthCubit>().lessonsType = 1;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.43,
                                  decoration: BoxDecoration(
                                      color:  injector.get<AuthCubit>().lessonsType== 1
                                          ? Colors.green.shade500
                                          : Colors.white,
                                      borderRadius: EasyLocalization.of(context)!.currentLocale!.languageCode =='en'?const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)):const BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Follow lessons'.translate(),
                                        style: GoogleFonts.raleway(
                                            color:  injector.get<AuthCubit>().lessonsType ==
                                                1
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    injector.get<AuthCubit>().lessonsType = 2;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: sw * 0.45,
                                  decoration: BoxDecoration(
                                      color:  injector.get<AuthCubit>().lessonsType ==
                                          2
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: EasyLocalization.of(context)!.currentLocale!.languageCode =='ar'?const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)):const BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'the lessons online'.translate(),
                                        style: GoogleFonts.raleway(
                                            color:  injector.get<AuthCubit>().lessonsType ==
                                                2
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5), border: Border.all(width: 1, color: Colors.grey)),
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: Colors.grey.shade200,
                                    checkColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5), side: const BorderSide(width: 1, color: Colors.grey)),
                                  ),
                                ),
                                

                                Text(
                                  'Terms & Conditions'.translate(),
                                  style: GoogleFonts.raleway(color: Colors.grey.shade400, fontSize: 14),
                                )
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    ProgressPopup(context);
                                    injector
                                        .get<AuthCubit>()
                                        .signUpWithEmailAndPassword(
                                            email: email.text,
                                            password: password.text,
                                            context: context,
                                            fullName: fullName.text,
                                            phone: phone.text,
                                            type: type,
                                            userName: userName.text)
                                        .then((value) {
                                      if (value == 200) {
                                        // NanyAuthController().signInWithEmailAndPassword(email.text, password.text, context).then((value) {
                                        //   SaveData();
                                        //   if (value == true) {
                                        //     setState(() {
                                        //
                                        //     });
                                        //   }
                                        // });
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const nany_signin_view()));

                                      } else if( value ==405) {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  const VerifyAccount()));

                                      }else{
                                        Navigator.pop(context);
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      height = 60;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Submit'.translate(),
                                          style: GoogleFonts.raleway(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (context) => const nany_signin_view()));
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(width: 1, color: Theme.of(context).primaryColor))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Already registered Sign In here'.translate(),
                                          style: GoogleFonts.raleway(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Theme.of(context).primaryColor,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SaveData() async {
    nannyDataModel model = nannyDataModel();
    model.email = email.text;
    model.password = password.text;
    model.price = 0;
    model.earnings = 0;
    model.fullname = fullName.text;
    model.username = userName.text;
    model.mobile = phone.text;
    model.children = 0;
    model.id = FirebaseAuth.instance.currentUser!.uid;
    model.image = 'https://cdn.pixabay.com/photo/2017/04/20/07/07/add-2244771_960_720.png';
    model.education = Education();
    model.account = Account();
    model.availability = [];
    model.transactionHistory = [];
    model.address = Address();
    FirebaseFirestore.instance.collection('nanny').doc(FirebaseAuth.instance.currentUser!.uid).set(model.toJson()).then((value) => {
          AnimatedSnackBar(
            builder: ((context) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                          child: Text(
                        'Account Created',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                ),
              );
            }),
          ).show(context)
        });
  }
}
