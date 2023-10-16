import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_page.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        QuestionPage.id : (context) => const QuestionPage(),
        ResultScreen.idRes : (context) => ResultScreen(),
      },
      home: const HomePage(),
    );
  }
}