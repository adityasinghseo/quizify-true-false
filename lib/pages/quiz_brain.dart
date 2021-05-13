import 'package:new_app_one/pages/question.dart';
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List _questionBank = [
    Question("1", "You can lead a cow down stairs but not up stairs.", false),
    Question("2", "Approximately one quarter of human bones are in the feet.", true),
    Question("3", "A slug's blood is green.", true)
  ];
 String getQuestionText() {
   return _questionBank[_questionNumber].questionText;
 }
 String getQuestionNum() {
   return _questionBank[_questionNumber].questionPosition;
 }
 bool getCorrectAnswer() {
   return _questionBank[_questionNumber].questionAnswer;
 }

 void nextQuestion () {
   if (_questionNumber < _questionBank.length-1) {
     _questionNumber++;
   }
 }

  bool isFinished() {
   if (_questionNumber >=  _questionBank.length -1) {
     print('Now returning true');
    return true;
   }
   else {
     return false;
   }
  }

  void reset() {
   _questionNumber = 0;
  }

}