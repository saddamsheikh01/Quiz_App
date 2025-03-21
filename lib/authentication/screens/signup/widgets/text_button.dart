import 'package:flutter/material.dart';
import 'package:quiz_app/authentication/screens/login/login.dart';
import 'package:quiz_app/model/constants.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key, required this.title, required this.subTitle,
  });

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subTitle,
          style: TextStyle(color: texts, fontSize: 14),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              title,
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ))
      ],
    );
  }
}
