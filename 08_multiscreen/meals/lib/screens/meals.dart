import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealDetailsScreen(
        meal: meal,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget? body;
    if (meals.isEmpty) {
      body = const Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Nothing here'),
        ],
      ));
    } else {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, idx) {
          return MealItem(
            meal: meals[idx],
            onSelect: (meal) => _selectMeal(context, meal),
          );
        },
      );
    }

    if (title != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: body);
    } else {
      return body;
    }
  }
}
