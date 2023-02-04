import 'package:buddy_saving/constant/app_color.dart';
import 'package:buddy_saving/screens/screen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ScreenOne(),
              ),
            );
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: appColor2),

            child: const Center(
              child: Text(
                'Click to start Saving',
                style: TextStyle(color: appColor4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
