import 'package:buddy_saving/screens/screen5.dart';
import 'package:flutter/material.dart';
import '../Utils/app_button.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/dashboard.dart';

enum SaveDuration { threeMonths, sixMonths, oneYear }

class ScreenFour extends StatefulWidget {
  const ScreenFour({Key? key}) : super(key: key);

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  SaveDuration? _character = SaveDuration.threeMonths;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const CustomAppBar(),
                    DashBoard(screenWidth: screenWidth),
                    const SizedBox(height: 40),
                    Row(
                      children: const [
                        Text(
                          'How long do you and your buddies want to save for?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox()
                      ],
                    ),
                    buildRadioButton('3 Months'),
                    buildRadioButton('6 Months'),
                    buildRadioButton('1 Year'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Start Date',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox()
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(color: Colors.grey, width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '06/12/2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.calendar_month),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'End Date',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox()
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(color: Colors.grey, width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '06/12/2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.calendar_month),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50,)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Text(
                          'Relationship with your buddies',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox()
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Select option',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_drop_down),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.85,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ScreenFive(),
                        ),
                      );
                    },
                    child: AppButton(screenWidth: screenWidth, text: 'Next'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildRadioButton(String title) {
    return ListTile(
      title: Text(title),
      leading: Radio<SaveDuration>(
        activeColor: Colors.black,
        value: title == '3 Months'
            ? SaveDuration.threeMonths
            : title == '6 Months'
            ? SaveDuration.sixMonths
            : SaveDuration.oneYear,
        groupValue: _character,
        onChanged: (SaveDuration? value) {
          setState(() {
            _character = value;
          });
        },
      ),
    );
  }
}
