import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/common/forget_password_otp_view.dart';
import 'package:nanny_co/common/widget/ProgressPopUp.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/nany/auth_view/nany_signin_view.dart';
import 'package:nanny_co/nany/widget/TextFeild.dart';
import 'package:nanny_co/parent/auth_view/parent_signin_view.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key, required this.role}) : super(key: key);
  final String role;
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'Please enter details to continue.',
                          style: GoogleFonts.nanumGothic(color: Colors.grey.shade400, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFieldNany(
                          hintText: 'Email Address',
                          controller: email,
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.alternate_email,
                                color: Colors.grey.shade400,
                                size: 20,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                              onPressed: () {
                                ProgressPopup(context);

                                injector.get<AuthCubit>().checkEmail(email.text, context).then((value) => value == true
                                    ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => ForgotPasswordOtpView(
                                              email: email.text,
                                              role: role,
                                            )))
                                    : Navigator.pop(context));
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
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => role == 'nany' ? const nany_signin_view() : const ParentSignInView()));
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
      ),
    );
  }
}
