import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/forget_password_otp_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
class forgot_password_view extends StatelessWidget{
  forgot_password_view({this.role});
  var role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sh,
        width: sw,
        child: Stack(
          children: [
            Container(
              height: sh*0.3,
              width: sw,
              color: Theme.of(context).primaryColor,
              child: Center(
                child:  Container(
                  height: sh*0.15,
                  width: sw*0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/logo/logo.png')
                      )
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: sh*0.76,
                width: sw,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: GoogleFonts.nanumGothic(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold ,
                            fontSize: 24
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Please enter details to continue.',
                        style: GoogleFonts.nanumGothic(
                            color: Colors.grey.shade400,
                            fontSize: 14
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFieldNany(
                        hintText: 'Email Address',
                        suffixIcon: InkWell(onTap:(){
                        },child: Icon(Icons.alternate_email,color: Colors.grey.shade400,size: 20,)),),

                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>forgot_password_otp_view(role: 'nany',)));
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
                                      'Submit',
                                      style: GoogleFonts.nanumGothic(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward,color: Colors.white,size: 20,)
                                  ],
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.4,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(onPressed: (){

                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>role=='nany'?nany_signin_view():parent_signin_view()));
                        },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1,color:Colors.white))
                            ),
                            child:Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_back,color:Theme.of(context).primaryColor,size: 20,),
                                    Text(
                                      'Back to Login',
                                      style: GoogleFonts.nanumGothic(
                                        color:Theme.of(context).primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
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
          ],
        ),
      ),
    );
  }
}
