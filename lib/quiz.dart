import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/answer.dart';

class Quiz extends StatelessWidget {
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex
  });

  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText'],),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer){
          return Answer(()=> answerQuestion(answer['score']),answer['text']);
        }).toList(),
      ],
    );
  }
}
