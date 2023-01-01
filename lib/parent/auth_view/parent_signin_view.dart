import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/parent/auth_view/parent_signup_view.dart';
import 'package:nanny_co/parent/auth_view/verify.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';

import '../../common/forgot_password_view.dart';
import '../../common/widget/ProgressPopUp.dart';

class ParentSignInView extends StatefulWidget {
  const ParentSignInView({Key? key}) : super(key: key);

  @override
  _ParentSignInViewState createState() => _ParentSignInViewState();
}

class _ParentSignInViewState extends State<ParentSignInView> {
  var obscure = true;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
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
                height: sh * 0.6,
                width: sw,
                decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/Group 723.png'))),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: sh * 0.46,
                  width: sw,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Login as Parent.'.translate(),
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
                          Container(
                            height: height,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == '') {
                                  return 'Please fill out this field'.translate();
                                } else if (!value!.contains('@')) {
                                  return 'Please enter valid email address'.translate();
                                } else {
                                  return null;
                                }
                              },
                              controller: email,
                              decoration: InputDecoration(
                                hintText: 'Enter Username'.translate(),
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade400,
                                ),
                                hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: password,
                              obscureText: obscure,
                              validator: (String? value) {
                                if (value == '') {
                                  return 'Please fill out this field'.translate();
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Password'.translate(),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obscure = !obscure;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.grey.shade400,
                                    )),
                                hintStyle: GoogleFonts.raleway(color: Colors.grey.shade400, fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => ForgotPasswordView(
                                              role: 'parent',
                                            )));
                                  },
                                  child: Text(
                                    'Forgot Password'.translate(),
                                    style: GoogleFonts.raleway(
                                        color: Theme.of(context).primaryColor, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    ProgressPopup(context);
                                    injector.get<AuthCubit>().signInWithEmailAndPassword(email.text, password.text, context).then((value) {
                                      print(value);
                                      if (value == 200) {
                                        setState(() {
                                          Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context) => const parent_bottombar_view()),
                                            (route) => false,
                                          );
                                        });
                                      }else if(value ==405){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  VerifyAccount()));

                                      }  else {
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
                                          'Login'.translate(),
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
                                        .pushReplacement(MaterialPageRoute(builder: (context) => const ParentSignupView()));
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
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
                                          'to Nanny App Sign Up here'.translate(),
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
}
