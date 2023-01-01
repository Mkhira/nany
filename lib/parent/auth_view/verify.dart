import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/constants.dart';
import 'package:nanny_co/instance.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: sh * 0.4,
                  width: sw,
                  decoration: const BoxDecoration(image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Group 723.png'))),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    controller: injector.get<AuthCubit>().emailController,
                    decoration: InputDecoration(
                      hintText: 'E-mail'.translate(),

                      hintStyle: GoogleFonts.raleway(
                          color: Colors.grey.shade400, fontSize: 14),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                    ),
                  ),
                ),
               const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OTPTextField(
                    length: 4,
                    controller: injector.get<AuthCubit>().otpController,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 80,
                    style: const TextStyle(
                        fontSize: 17
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);

                      injector.get<AuthCubit>().getValueCode(pin);
                    },
                  ),
                ),

                const SizedBox(
                  height: 13,
                ),

                SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: ElevatedButton(onPressed: ()async{
                      injector.get<AuthCubit>().verfiyAcount( injector.get<AuthCubit>().codeValue,context);
                    }, child: Text('Verfiy')))

              ],
            );
          },
        ),
      ),
    );
  }
}
