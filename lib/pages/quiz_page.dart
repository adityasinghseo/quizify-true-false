import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int scoreCounter = 1;
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
                context: context,
                title: 'Finished',
                desc: ("You got $scoreCounter"))
            .show();
        quizBrain.reset();
        scoreKeeper = [];
      }
     else if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        scoreCounter++;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question " + quizBrain.getQuestionNum(),
                  style: TextStyle(color: Colors.yellow, fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(bottom: 15, top: 15),
                onPrimary: Colors.white,
                primary: Colors.green,
                textStyle: TextStyle(
                  fontSize: 20,
                )),
            onPressed: () {
              checkAnswer(true);
            },
            child: Text("TRUE"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(bottom: 15, top: 15),
                onPrimary: Colors.white,
                primary: Colors.red,
                textStyle: TextStyle(
                  fontSize: 20,
                )),
            onPressed: () {
              checkAnswer(false);
            },
            child: Text("FALSE"),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
