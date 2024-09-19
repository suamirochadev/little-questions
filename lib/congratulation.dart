import 'package:flutter/material.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key, required this.score, required this.restart});

  final int score;
  final void Function() restart;

  String get quoteCongrats {
    if (score <= 1) {
      return 'You can improve!';
    } else if (score <= 2) {
      return 'Good job!';
    } else {
      return 'Finished the game!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.vertical,
        children: [
          Text(
            quoteCongrats,
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images/congrats.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: restart,
              child: const Text(
                'Restart',
              ),
            ),
          )
        ],
      ),
    );
  }
}
