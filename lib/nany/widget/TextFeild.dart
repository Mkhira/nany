import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_co/constants.dart';

class TextFieldNany extends StatelessWidget {
  TextFieldNany(
      {Key,
      key,
      this.hintText,
      this.suffixIcon,
      this.obsecure,
      this.validation,
      this.controller,
      this.height,
      this.enabled,
      this.type = TextInputType.text})
      : super(key: key);
  var hintText;
  var obsecure;
  var suffixIcon;
  var validation;
  var controller;
  double? height;
  TextInputType type;
  var enabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: type,
        enabled: enabled ?? true,
        validator: validation ??
            (String? value) {
              if (value == '') {
                return 'Please fillout this field';
              } else {
                return null;
              }
            },
        style: const TextStyle(color: Colors.grey),
        controller: controller,
        obscureText: obsecure ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          suffixIcon: suffixIcon ?? Container(),
          hintStyle: GoogleFonts.nanumGothic(color: Colors.grey.shade400, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}
