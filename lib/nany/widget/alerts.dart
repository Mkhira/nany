import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class Alerts {
  static showSnackBar({required BuildContext context, required String message, Color color = Colors.red}) {
    AnimatedSnackBar(
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 70,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                )),
              ],
            ),
          ),
        );
      }),
    ).show(context);
  }
}
