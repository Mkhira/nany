import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/chnagePassord.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';

import '../constants.dart';

class ForgotPasswordOtpView extends StatefulWidget {
  ForgotPasswordOtpView({Key? key, this.role, required this.email}) : super(key: key);
  var role;
  final String email;

  @override
  State<ForgotPasswordOtpView> createState() => _ForgotPasswordOtpViewState();
}

class _ForgotPasswordOtpViewState extends State<ForgotPasswordOtpView> {
  TextEditingController otp = TextEditingController();
  CountdownTimerController? controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 40;
  bool resend = false;
  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    setState(() {
      resend = true;
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        '''Please enter the OTP which we sent you on 
                 your registered number''',
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
                              controller: otp,
                              maxLength: 4,
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CountdownTimer(
                              controller: controller,
                              widgetBuilder: (_, time) {
                                if (time == null) {
                                  return Text('00');
                                }
                                return Text(' ${time.sec}');
                              },
                              onEnd: onEnd,
                              endTime: endTime,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sh * 0.03,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '''Resend OTP''',
                          style: GoogleFonts.nanumGothic(color: Colors.white, fontSize: 14),
                        ),
                        style: TextButton.styleFrom(backgroundColor: resend ? Theme.of(context).primaryColor : Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              ProgressPopup(context);

                              injector.get<AuthCubit>().verifyCode(email: widget.email, otp: otp.text, context: context).then((value) {
                                value == true
                                    ? Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => ChangePasswordView(email: widget.email, role: widget.role)))
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
