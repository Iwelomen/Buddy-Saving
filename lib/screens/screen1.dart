import 'package:buddy_saving/Utils/custom_text_field.dart';
import 'package:buddy_saving/screens/screen2.dart';
import 'package:flutter/material.dart';

import '../Utils/app_button.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/dashboard.dart';

enum SingingCharacter { Yes, No }

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  SingingCharacter? _character = SingingCharacter.Yes;
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const CustomAppBar(),
                        const SizedBox(
                          height: 25,
                        ),
                        DashBoard(screenWidth: screenWidth),
                        const SizedBox(height: 40),
                        Row(
                          children: const [
                            Text(
                              'Give your buddy saving a title',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox()
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          titleController,
                          'Title',
                          (val) =>
                              val.isEmpty || val == null ? 'Enter title' : null,
                          '',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Text(
                              'How many buddy will be saving with?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox()
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          titleController,
                          'Title',
                          (val) =>
                              val.isEmpty || val == null ? 'Enter title' : null,
                          '',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Text(
                              'Do you and your buddies have a target',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox()
                          ],
                        ),
                        Column(
                          children: [
                            buildRadioButton('Yes'),
                            buildRadioButton('No')
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
                          builder: (_) => const ScreenTwo(),
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
      leading: Radio<SingingCharacter>(
        activeColor: Colors.black,
        value: title == 'Yes' ? SingingCharacter.Yes : SingingCharacter.No,
        groupValue: _character,
        onChanged: (SingingCharacter? value) {
          setState(() {
            _character = value;
          });
        },
      ),
    );
  }
}
