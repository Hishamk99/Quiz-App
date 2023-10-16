import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class AskAndAnswers extends StatefulWidget {
  const AskAndAnswers({super.key});

  @override
  State<AskAndAnswers> createState() => _AskAndAnswersState();
}

class _AskAndAnswersState extends State<AskAndAnswers> {
  int currentQuestionIndex = 0;
  List<String> seletedAnswer = List.unmodifiable([]);

  void nextAnswer(String answer) {
    List<String> newList = List<String>.from(seletedAnswer);
    newList.add(answer);
    //print(newList);
    

    setState(() {
      seletedAnswer = newList;
      currentQuestionIndex++;
      if (currentQuestionIndex == questions.length) {
      Navigator.pushNamed(context, ResultScreen.idRes , arguments: seletedAnswer);
      currentQuestionIndex = 0;
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          kdeepPurpleAccent,
          kPurpleAccent,
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQuestion.getShufflrdList().map((e) {
              return Container(
                // e(currentQuestion.answers) => list
                // children => list
                // using ... to make all children of coloum 1 list
                margin: const EdgeInsets.all(10),
                child: AnswerButton(
                  ans: e,
                  onPressed: () {
                    nextAnswer(e);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
