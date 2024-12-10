import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/fancy_answer_button.dart';
// import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              // style: GoogleFonts.lato(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Note: ... unwraps the list (i.e. extend)
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return FancyAnswerButton(text: answer, onTap: answerQuestion);
            }),
            // Alternative to map:
            // for (var answer in currentQuestion.answers)
            //   FancyAnswerButton(text: answer, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
