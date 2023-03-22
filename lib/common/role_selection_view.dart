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
              decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login As'.translate(),
                      style: GoogleFonts.raleway(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold  ,
                          fontSize: 30
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      'Please select one option.'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey.shade400,
                          fontSize: 14
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ParentSignInView()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: Localizations.localeOf(context).languageCode=='en'? const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)):const BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                              border: Border.all(width: 1,color: Colors.grey.shade400)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Login as Parent.'.translate(),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const nany_signin_view()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: Localizations.localeOf(context).languageCode =='en'?const BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)):const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                border: Border.all(width: 1,color: Colors.grey.shade400)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Text(
                                  'Login as Sitter'.translate(),
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
