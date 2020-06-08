import 'package:flutter/material.dart';

import './pages/quiz.dart';
import './pages/result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  bool finished = false;

  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Dog', 'score': 0},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      finished = false;
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      if (_questionIndex == (_questions.length - 1)) {
        finished = true;
        return;
      }
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My first app'),
            ),
            body: finished
                ? Result(_totalScore, _resetQuiz)
                : Quiz(
                    questionText: _questions[_questionIndex]['questionText'],
                    answers: _questions[_questionIndex]['answers'],
                    answerQuestion: _answerQuestion,
                  )));
  }
}
