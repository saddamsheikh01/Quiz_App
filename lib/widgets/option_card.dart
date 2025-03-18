import 'package:flutter/material.dart';
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
              fontSize: 22
          ),
        ),
      ),
    );
  }
}