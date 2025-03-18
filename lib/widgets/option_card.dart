import 'package:flutter/material.dart';
import 'package:quiz_app/model/constants.dart';
class OptionCard extends StatelessWidget {

  const OptionCard({super.key,
    required this.option,   required this.color,});
  final String option;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color:color ,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
            // we will decide if the color  we are receiving  here
            // what ratio of the color 'red' and 'green' color on it
            color: color.red != color.green ? neutral : Colors.black,
          ),
        ),
      ),
    );
  }
}