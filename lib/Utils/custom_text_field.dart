import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final dynamic func;
  CustomTextField(this.controller, this.hintText, this.func, this.labelText);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: widget.hintText==accountNoText?TextInputType.number: TextInputType.text,
      cursorColor: Colors.black,
      controller: widget.controller,
      validator: widget.func,
      // maxLength:widget.hintText==accountNoText?10: widget.hintText==cacNoText?6:null,
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: InputDecoration(
        counterText: "",
        labelText: widget.labelText,
        labelStyle: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
