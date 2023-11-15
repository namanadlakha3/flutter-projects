import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDeatilsScreen extends StatelessWidget {
  const MealDeatilsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity,
      ),
    );
  }
}
