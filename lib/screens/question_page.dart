import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/ask_answer.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  static String id = 'QuestionPage';

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AskAndAnswers(),
      ),
    );
  }
}
