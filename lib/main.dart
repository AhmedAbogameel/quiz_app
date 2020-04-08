import'package:flutter/material.dart';
import 'package:quizapp/result.dart';
import 'quiz.dart';
import 'package:quizapp/answer.dart';
import 'package:quizapp/question.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _questionIndex = 0;
  int _totalScore = 0;
  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Abogameel', 'score': 1},
        {'text': 'Abogameel', 'score': 1},
        {'text': 'Abogameel', 'score': 1},
        {'text': 'Abogameel', 'score': 1},
      ],
    },
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;
      setState(() {
          _questionIndex++;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App'),),
      body: _questionIndex < _questions.length
          ? Quiz(answerQuestion: _answerQuestion,questionIndex: _questionIndex,questions: _questions,)
          : Result(_totalScore,_resetQuiz)
    );
  }
}
