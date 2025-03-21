import 'package:flutter/material.dart';
import 'package:quiz_app/model/constants.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: texts),
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: "Email",
        labelStyle: TextStyle(color: texts),
        hintText: 'Enter your Email',
        hintStyle: TextStyle(color: texts),
        border: OutlineInputBorder(),
      ),
    );
  }
}
