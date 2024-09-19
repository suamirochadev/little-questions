import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: Text(
        text,
      ),
    );
  }
}
