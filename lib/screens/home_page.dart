import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/screens/question_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              kdeepPurpleAccent,
              kPurpleAccent,
            ]),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  color: Colors.white.withOpacity(opacity),
                  width: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Learn Flutter !',
                  style: TextStyle(
                    color: Colors.white.withOpacity(opacity),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(opacity)),
                  onPressed: () {
                    Navigator.pushNamed(context, QuestionPage.id);
                  },
                  icon: const Icon(Icons.arrow_right_alt_outlined),
                  label: Text(
                    'Start Quiz',
                    style: TextStyle(
                      color: Colors.white.withOpacity(opacity),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
