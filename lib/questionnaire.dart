import 'package:flutter/material.dart';
import 'package:littlequestions/answer.dart';
import 'package:littlequestions/question.dart';

class Questionnaire extends StatelessWidget {
  const Questionnaire({
    super.key,
    required this.answer,
    required this.questions,
    required this.selectedQuestion,
  });

  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    if (!hasSelectedQuestion) {
      return const Center(
        child: Text(
          'No questions available!',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    // Recuperar as respostas da pergunta selecionada
    List<Map<String, Object>> answers =
        questions[selectedQuestion]['answers'] as List<Map<String, Object>>;

    return Column(
      children: [
        // Mostrar a pergunta
        Question(
          text: questions[selectedQuestion]['text'] as String,
        ),
        // Mostrar as respostas
        ...answers.map((ans) {
          return Answer(
              text: ans['textAns'].toString(),
              onSelected: () {
                answer(ans['score'] as int);
              },
            );
        }),
      ],
    );
  }
}
