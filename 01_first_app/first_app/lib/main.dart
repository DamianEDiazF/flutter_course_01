import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: GradientContainer(
        colors: const [Colors.deepOrange, Colors.lime],
      ),
    ),
  ));
}
