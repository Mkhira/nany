import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/privacy_policy_view.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/data/model/dto_model/auth_data_response.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/parent/add_child/Controller/add_child_cubit.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_nanny_booking/parent_booking_history_view.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';

class parent_drawer_view extends StatefulWidget {
 parent_drawer_view({Key,key}) : super(key: key);

  @override
  _parent_drawer_viewState createState() => _parent_drawer_viewState();
}

class _parent_drawer_viewState extends State<parent_drawer_view> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: Column(
        children: [
          Container(
            height: sh*0.25,
            width: sw,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,
                        color: Colors.white,),
                    ),
                    SizedBox(width: 10,)
                  ],
                ),
                SizedBox(height: sh*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 25,),
            Container(
            height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 2),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/lady.jpg'
                      )
                  )
              ),
            ),
                    SizedBox(width: 10,),
                    Text(
                      'Hi Shieanne,',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.bold ,
                          fontSize: 20
                      ),
                    ),
        ],
                ),
                SizedBox(height: 25,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=0;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Home'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=3;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'My Profile'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    injector.get<AddChildCubit>().getChildList();
                    parent_bottombar_viewState.selectedIndex=11;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'My Child'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    parent_bottombar_viewState.selectedIndex=6;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parent_bottombar_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Booking History'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Text(
                    'About Us'.translate(),
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold ,
                        fontSize: 14
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>privacy_policy_view()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Privacy Policy'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Text(
                    'Terms & Conditions'.translate(),
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold ,
                        fontSize: 14
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Text(
                    'FAQ'.translate(),
                    style: GoogleFonts.raleway(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold ,
                        fontSize: 14
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    injector.get<AuthCubit>().changeLanguage(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      EasyLocalization.of(context)!.currentLocale == const Locale('en','EN')?'العربيه':'English',
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: (){
                    SettingsProvider.current.saveLogin(false);
                    SettingsProvider.current.saveUser(AuthDataResponse());

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ParentSignInView()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: Text(
                      'Logout'.translate(),
                      style: GoogleFonts.raleway(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold ,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
