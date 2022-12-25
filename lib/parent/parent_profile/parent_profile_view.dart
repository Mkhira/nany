import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/data/model/dto_model/auth_data_response.dart';
import 'package:nanny_co/domain/config/setting_provider.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/parent/parent_profile/Controller/update_parent_cubit/update_parent_cubit.dart';

import '../auth_view/Controller/Auth_controller.dart';
import '../parent_drawer.dart/parent_drawer_view.dart';

class ParentProfileViewScreen extends StatefulWidget {
  const ParentProfileViewScreen({Key? key}) : super(key: key);

  @override
  State<ParentProfileViewScreen> createState() => _ParentProfileViewScreenState();
}

class _ParentProfileViewScreenState extends State<ParentProfileViewScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // profile_controller.getProfileData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: parent_drawer_view(),
        body: SizedBox(
            height: sh,
            width: sw,
            child: Stack(children: [
              Container(
                  height: sh * 0.35,
                  width: sw,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: const Icon(
                                    Icons.menu,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {

                                    SettingsProvider.current.saveLogin(false);
                                    SettingsProvider.current.saveUser(AuthDataResponse());

                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (context) => const ParentSignInView()));
                                  },
                                  child: const Icon(
                                    Icons.logout,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Profile ',
                                  style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                const Image(image: AssetImage('assets/images/dots.png')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: sh * 0.71,
                  width: sw,
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      SettingsProvider.current.appSettings.userData?.image ?? '',
                                    ))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                SettingsProvider.userData.fullName ?? '',
                                style:
                                    GoogleFonts.raleway(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                SettingsProvider.userData.courseName ?? '',
                                style: GoogleFonts.raleway(color: Colors.redAccent, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {
                                      parent_bottombar_viewState.selectedIndex = 4;
                                      injector.get<UpdateParentCubit>().getCites();
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(builder: (context) => const parent_bottombar_view()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.edit,
                                              size: 12,
                                            ),
                                            Text(
                                              ' Edit Profile',
                                              style: GoogleFonts.raleway(color: Colors.white, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 10,
                            )
                          ],
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(SettingsProvider.userData.phone ?? '',
                                          style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(
                                        SettingsProvider.userData.email ?? '',
                                        style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Birthday',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(
                                        DateFormat('MM/dd/yyyy').format(SettingsProvider.userData.dob!) ?? '',
                                        style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gender',
                                        style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      Text(
                                        SettingsProvider.userData.gender ?? '',
                                        style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 10,
                            )
                          ],
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(SettingsProvider.userData.address ?? '',
                                maxLines: 10, style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          parent_bottombar_viewState.selectedIndex = 6;
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const parent_bottombar_view()));
                        },
                        child: Container(
                          width: sw,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ],
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Booking History',
                                maxLines: 10,
                                style: GoogleFonts.raleway(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          SettingsProvider.current.saveLogin(false);
                          SettingsProvider.current.saveUser(AuthDataResponse());


                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ParentSignInView()));
                        },
                        child: Container(
                          width: sw,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ],
                            border: Border.all(
                              width: 5,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Logout',
                                maxLines: 10,
                                style: GoogleFonts.raleway(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  ),
                ),
              ),
            ])));
  }
}
