import 'package:flutter/material.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    restartQuiz();
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = StartScreen(onStartQuiz: switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
            chosenAnswers: selectedAnswers, onRestartQuiz: restartQuiz);
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromARGB(255, 55, 20, 116), Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: activeScreen,
        ),
      ),
    );
  }
}
