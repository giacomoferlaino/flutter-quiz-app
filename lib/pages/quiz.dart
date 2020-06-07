import 'package:flutter/cupertino.dart';

import './widgets/question.dart';
import './widgets/answer.dart';

class Quiz extends StatelessWidget {
  final String questionText;
  final List<String> answers;
  final void Function() answerQuestion;

  Quiz(
      {@required this.questionText,
      @required this.answers,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionText),
        ...answers.map((answer) => Answer(
              text: answer,
              onPressed: answerQuestion,
            ))
      ],
    );
  }
}
