import 'package:flutter/material.dart';
import 'package:expense_record/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);
var kColorSchemeDark =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.purple);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      darkTheme: ThemeData().copyWith(
        colorScheme: kColorSchemeDark,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorSchemeDark.onPrimaryContainer,
            foregroundColor: kColorSchemeDark.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorSchemeDark.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeDark.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorSchemeDark.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      themeMode: ThemeMode.light,
      home: const Expenses(),
    ),
  );
}
