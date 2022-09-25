import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/parent/auth_view/parent_signup_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';

import '../../common/forgot_password_view.dart';
import '../../common/widget/ProgressPopUp.dart';
import 'Controller/Auth_controller.dart';

class parent_signin_view extends StatefulWidget {
  const parent_signin_view({Key ,key}) : super(key: key);

  @override
  _parent_signin_viewState createState() => _parent_signin_viewState();
}

class _parent_signin_viewState extends State<parent_signin_view> {
  var obscure=true;
  GlobalKey<FormState> formkey = new GlobalKey();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  double height = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sh,
        width: sw,
        child: Stack(
          children: [
            Container(
              height: sh*0.6,
              width: sw,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Group 723.png')
                  )
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: sh*0.46,
                width: sw,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Login As Parent',
                          style: GoogleFonts.raleway(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold  ,
                              fontSize: 24
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Please enter details to continue.',
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade400,
                              fontSize: 14
                          ),
                        ),
                        SizedBox(height: 20,),
                       Container(
                         height: height,
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: TextFormField(
                           validator: (String? value) {
                             if (value == '') {
                               return 'Please fillout this field';
                             } else if (!value!.contains('@')) {
                               return 'Please enter valid email adress';
                             } else {
                               return null;
                             }
                           },
                           controller: email,
                           decoration: InputDecoration(
                             hintText: 'Enter Username',
                             suffixIcon: Icon(Icons.person,color: Colors.grey.shade400,),
                             hintStyle:GoogleFonts.raleway(
                                 color: Colors.grey.shade400,
                                 fontSize: 14
                             ),
                             contentPadding: EdgeInsets.symmetric(horizontal: 20),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide(color: Colors.grey.shade400)
                             ),
                             focusedBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(color: Colors.grey.shade400)
                             ),
                             enabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(color: Colors.grey.shade400)
                             ),
                             disabledBorder:  OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(color: Colors.grey.shade400)
                             ),
                           ),
                         ),
                       ),
                        SizedBox(height: 10,),
                        Container(
                          height: height,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: password,
                            obscureText: obscure,
                            validator: (String? value) {
                              if (value == '') {
                                return 'Please fillout this field';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: InkWell(onTap:(){
                                setState(() {
                                  obscure=!obscure;
                                });
                              },child: Icon(Icons.remove_red_eye,color: Colors.grey.shade400,)),
                              hintStyle:GoogleFonts.raleway(
                                  color: Colors.grey.shade400,
                                  fontSize: 14
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400)
                              ),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400)
                              ),
                              disabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey.shade400)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>forgot_password_view(role: 'parent',)));
                                },
                                child: Text(
                                  ' Forgot Password?',
                                  style: GoogleFonts.raleway(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(onPressed: (){
                            if (formkey.currentState!.validate()) {
                              ProgressPopup(context);
                              parentFirebaseAuthController()
                                  .signInWithEmailAndPassword(
                                  email.text, password.text,context)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>parent_bottombar_view()),(route) => false,);
                                  });
                                } else {
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
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                              child:Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Login',
                                        style: GoogleFonts.raleway(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward,color: Colors.white,size: 20,)
                                    ],
                                  ),
                                ),
                              )),
                        ), SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(onPressed: (){
                            setState(() {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_signup_view()));
                            });
                          },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1,color: Theme.of(context).primaryColor))
                              ),
                              child:Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'New to Nanny App Sign Up here',
                                        style: GoogleFonts.raleway(
                                          color:Theme.of(context).primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward,color:Theme.of(context).primaryColor,size: 20,)
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
    );
  }
}
