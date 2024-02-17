import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'images/quiz-logo.png',
          width: 300,
          //Use this for opacity by playing around with the values instead of using Opacity yenyewe
          color: const Color.fromRGBO(150, 255, 255, 1),
        ),

        // Opacity(
        //   opacity: 0.6,
        //    child: Image.asset(
        //   'images/quiz-logo.png',
        //   width: 300,
        //   color: Colors.tealAccent,
        // ),
        // ),

        const SizedBox(height: 50),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 200),
        OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ))
      ],
    ));
  }
}
