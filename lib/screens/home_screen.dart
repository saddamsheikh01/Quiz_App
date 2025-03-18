import 'package:flutter/material.dart';
import 'package:quiz_app/model/constants.dart';
import 'package:quiz_app/model/questions_model.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/widgets/option_card.dart';
import 'package:quiz_app/widgets/questtion_widgets.dart';
import 'package:quiz_app/widgets/result_box.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _question = [
    Question(
        id: "10",
        title: 'what is 2+2?',
        option: {'5': false, "30": false, '4': true, "10": false}),
    Question(
        id: "11",
        title: 'what is 10+20?',
        option: {'5': false, "45": false, '30': true, "10": false})
  ];
  int index = 0;

// create score variable
  int score = 0;

  // create a boolean value to check if the user  has clicked
  bool isPressed = false;
  // create a function to display the next question
  bool isAlreadySelected = false;
  // create a function to display the next question

  void nextQuestion() {
    if (index == _question.length - 1) {

      //  this is the block where the question add
      showDialog(context: context,
          barrierDismissible: false,// this  will dismiss the function  on click  outside of the b0x
          builder: (ctx) => ResultBox(result: score, // total points the user got
            questionLength: _question.length, onPressed: startOver, // out of how many questions
          ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please select any option"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }


  // create a function for changing color
  void checkAnswerAndUpdate(bool value) {
    if(isAlreadySelected){
      return;

    }else{
      if(value == true){
        score++;

      }
      setState(() {
        isPressed = true;
        isAlreadySelected= false;
      });
    }

  }

  // create a function to start over
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isPressed= false;
      isAlreadySelected =false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(color: texts),
          ),
          backgroundColor: background,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text('Score: $score',
                style: TextStyle(
                  color: texts,
                  fontSize: 18,
                ),),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              QuestionWidget(
                question: _question[index].title, // first question in the list
                indexAction: index, // currently at zero index
                totalQuestions: _question.length, // total length of the list
              ),
              Divider(
                color: neutral,
              ),
              SizedBox(
                height: 25,
              ),
              for (int i = 0; i < _question[index].option.length; i++)
                GestureDetector(
                  onTap:() => checkAnswerAndUpdate(
                      _question[index].option.values.toList()[i]
                  ),
                  child: OptionCard(
                    option: _question[index].option.keys.toList()[i],

                    color: isPressed
                        ? _question[index].option.values.toList()[i] == true
                        ? correct
                        : incorrect
                        : neutral,
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: NextButton(
            nextQuestion: nextQuestion,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}