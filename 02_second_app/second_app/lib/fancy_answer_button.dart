import 'package:flutter/material.dart';

class FancyAnswerButton extends StatelessWidget {
  const FancyAnswerButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 200, 172, 255)),
        child: Text(text),
      ),
    );
  }
}
