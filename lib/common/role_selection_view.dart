import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';

class role_selection_view extends StatefulWidget {
  const role_selection_view({Key ,key}) : super(key: key);

  @override
  _role_selection_viewState createState() => _role_selection_viewState();
}

class _role_selection_viewState extends State<role_selection_view> {
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
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login As',
                      style: GoogleFonts.raleway(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold  ,
                          fontSize: 30
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Please select one option.',
                      style: GoogleFonts.raleway(
                          color: Colors.grey.shade400,
                          fontSize: 14
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>parent_signin_view()));
                          },
                          child: Container(
                            height: 50,
                            width: sw*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                              border: Border.all(width: 1,color: Colors.grey.shade400)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Login as Parent.',
                                  style: GoogleFonts.raleway(
                                      color: Colors.grey.shade400,
                                      fontSize: 14
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>nany_signin_view()));
                          },
                          child: Container(
                            height: 50,
                            width: sw*0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                                border: Border.all(width: 1,color: Colors.grey.shade400)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Text(
                                  'Login as Sitter',
                                  style: GoogleFonts.raleway(
                                      color: Colors.grey.shade400,
                                      fontSize: 14
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
