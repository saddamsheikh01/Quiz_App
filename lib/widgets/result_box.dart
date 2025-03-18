import 'package:flutter/material.dart';

import '../model/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key, required this.result, required this.questionLength, required this.onPressed});

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result",
              style: TextStyle(color: texts, fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: TextStyle(fontSize: 22.0),
              ),
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow // when the result is half of the question
                  : result < questionLength / 2
                  ? incorrect
                  : correct,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              result == questionLength / 2 ? 'Almost there ' : result <
                questionLength / 2 ? 'try Again' : 'Great',
              style: TextStyle(color: texts),),
            SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: Text('Start Over ',
              style: TextStyle(color: Colors.blue,
              fontSize: 20,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      ),
    );
  }
}
