import 'package:buddy_saving/constant/app_color.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  final double screenWidth;
  const DashBoard({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: screenWidth,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
      gradient: LinearGradient(colors: [
        appColor1, appColor2
      ])
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Buddy Savings',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Save with family and friend for your next rent',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
