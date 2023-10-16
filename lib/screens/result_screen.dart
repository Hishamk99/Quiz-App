import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/data/questions_list.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  static String idRes = 'Result Screen';

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'Question number': i + 1,
        'Question': questions[i].text,
        'correct answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    List<String> selectedAnswer =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    int count = 0;
    for (int i = 0; i < selectedAnswer.length - 1; i++) {
      if (selectedAnswer[i] == summaryData[i]['correct answer']) count++;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kdeepPurpleAccent,
                kPurpleAccent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'you answered $count out of ${questions.length} question correctly!',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 250, 205, 254),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ...summaryData.map((e) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: e['correct answer'].toString() ==
                                    selectedAnswer[index]
                                ? Colors.blue
                                : Colors.red,
                            child: Text(e['Question number'].toString()),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['Question'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 250, 205, 254),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(selectedAnswer[index++]),
                                Text(
                                  e['correct answer'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 32, 21, 83)),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextButton.icon(
                    icon: const Icon(Icons.restart_alt),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
