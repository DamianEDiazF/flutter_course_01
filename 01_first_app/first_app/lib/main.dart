import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: GradientContainer(
        colors: [Colors.deepOrange, Colors.lime],
      ),
    ),
  ));
}
