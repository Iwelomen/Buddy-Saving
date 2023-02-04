import 'package:buddy_saving/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double screenWidth;
  final String text;
  const AppButton({Key? key, required this.screenWidth, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: screenWidth * 0.9,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: appColor2),
      child:  Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
