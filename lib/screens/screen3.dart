import 'package:buddy_saving/Utils/custom_text_field.dart';
import 'package:buddy_saving/screens/screen4.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Utils/app_button.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/dashboard.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  final TextEditingController _amountController = TextEditingController();

  var formatter = DateFormat('yyyy/dd/MM');
  DateTime selectedDate = DateTime.now();
   String dateGet = "";

  Future<Null> _selectDate( context) async {
    final DateTime? picked = await showDatePicker(
      builder: ( context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  const ColorScheme.light(
              primary: Colors.purple, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child ?? SizedBox(),
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1959),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    dateGet = formatter.format(selectedDate);
  }

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
                          'How much do you want to save in 12 months?',
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
                      _amountController,
                      '#',
                      (val) => val.isEmpty || val == null
                          ? 'Enter amount to save'
                          : null,
                      '',
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: const [
                        Text(
                          'When do you want to start saving?',
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
                             Text(
                              dateGet ?? 'Today',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200),
                            ),
                            IconButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: const Icon(Icons.calendar_month),
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
                          builder: (_) => const ScreenFour(),
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
}
