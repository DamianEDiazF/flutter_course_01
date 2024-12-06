import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key,
      this.colors = const [
        Color.fromARGB(255, 55, 20, 116),
        Colors.deepPurple
      ]});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 250,
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () {
                print('button pressed');
              },
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Start Quiz',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
