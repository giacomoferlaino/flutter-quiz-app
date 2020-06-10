import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() resetQuiz;

  Result(this.score, this.resetQuiz);

  String _evaluateScore(int score) {
    if (score > 15) {
      return "You are really bad!";
    }
    if (score > 10 && score <= 15) {
      return "You are kind of bad";
    }
    if (score > 5 && score <= 10) {
      return "You are kind of good";
    }
    return "You are good";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          _evaluateScore(score),
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Reset quiz'),
          onPressed: resetQuiz,
        )
      ]),
    );
  }
}
