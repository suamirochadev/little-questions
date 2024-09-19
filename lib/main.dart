// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:littlequestions/congratulation.dart';
import 'package:littlequestions/questionnaire.dart';

void main() {
  runApp(const littleQuestions());
}

class littleQuestions extends StatefulWidget {
  const littleQuestions({super.key});

  @override
  State<littleQuestions> createState() => _littleQuestionsState();
}

class _littleQuestionsState extends State<littleQuestions> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  void answer(int score) {
    if (hasSelectedQuestion) {
      setState(
        () {
          _selectedQuestion++;
          _totalScore += score;
        },
      );
    }
      print(_totalScore);
  }

  void restart() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  void Function() funcao() {
    return () {
      print('Pergunta respondida #!');
    };
  }

  final _questions = [
    {
      'text':
          'What is the main widget that holds the visual structure of a Flutter app?',
      'answers': [
        {'textAns': 'Scaffold', 'score':1},
        {'textAns': 'Container', 'score': 0},
        {'textAns': 'AppBar', 'score': 0},
        {'textAns': 'Text', 'score': 0},
      ],
    },
    {
      'text': 'Which widget is commonly used to add padding around another widget in Flutter?',
      'answers': [
        {'textAns': 'Column', 'score':0},
        {'textAns': 'Padding', 'score': 1},
        {'textAns': 'Center', 'score': 0},
        {'textAns': 'Row', 'score': 0},
      ],
    },
    {
      'text': 'What method is used to start the execution of a Flutter app?',
      'answers': [
        {'textAns': 'runApp()', 'score':1},
        {'textAns': 'mainApp()', 'score': 0},
        {'textAns': 'startApp()', 'score': 0},
        {'textAns': 'initApp()', 'score': 0},
      ],
    },
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('littlequestions'),
          ),
          body: hasSelectedQuestion
              ? Questionnaire(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  answer: answer,
                )
              : Congratulation(score: _totalScore, restart: restart)),
    );
  }
}
