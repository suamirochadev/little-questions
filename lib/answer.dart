import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.text, required this.onSelected});
  final String text;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onSelected,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
