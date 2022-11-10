import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/nanny_bottombar_view/nanny_bottombar_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/parent/parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';

import '../constants.dart';

class ChangePasswordView extends StatefulWidget {
  ChangePasswordView({Key? key, required this.email, required this.role}) : super(key: key);
  final String email;
  final String role;

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.role);
    return Scaffold(
      body: SizedBox(
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
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password',
                        style: GoogleFonts.nanumGothic(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '''Please enter the New password ''',
                        style: GoogleFonts.nanumGothic(color: Colors.grey.shade400, fontSize: 14),
                      ),
                      SizedBox(
                        height: sh * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              controller: newPassword,
                              decoration: InputDecoration(
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
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              ProgressPopup(context);

                              injector
                                  .get<AuthCubit>()
                                  .changePassword(email: widget.email, password: newPassword.text, context: context)
                                  .then((value) {
                                value == true
                                    ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            widget.role != 'nany' ? const nany_signin_view() : const ParentSignInView()))
                                    : Navigator.pop(context);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            child: Padding(
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
                      SizedBox(
                        height: sh * 0.25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => widget.role == 'nany' ? const nany_signin_view() : const ParentSignInView()));
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), side: const BorderSide(width: 1, color: Colors.white))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Theme.of(context).primaryColor,
                                      size: 20,
                                    ),
                                    Text(
                                      'Back to Login',
                                      style: GoogleFonts.nanumGothic(
                                        color: Theme.of(context).primaryColor,
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
