import 'package:flutter/material.dart';
import 'package:fluttercourse/result.dart';
import './quiz.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    const {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 9},
        {'text': 'Blue', 'score': 8},
        {'text': 'Orange', 'score': 7},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Bear', 'score': 1},
        {'text': 'Lion', 'score': 2},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Dog', 'score': 4},
      ]
    },
    {
      'questionText': 'Who\'s your favorite singer?',
      'answers': [
        {'text': 'Morrissey', 'score': 5},
        {'text': 'St. Vincent', 'score': 6},
        {'text': 'Fiona Apple', 'score': 7},
        {'text': 'Whitney Houston', 'score': 8},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Yasmin');
    // print(dummy);
    // dummy = [];
    // questions = []; // this does not work if question is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
