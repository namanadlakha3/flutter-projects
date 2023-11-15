import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDeatilsScreen extends StatelessWidget {
  MealDeatilsScreen(
      {super.key, required this.meal, required this.toggleFavorite});

  final Meal meal;
  void Function(String) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              toggleFavorite(meal.id);
            },
            icon: Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Use listview or SingleChildScrollView
          Image.network(
            meal.imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
            height: 300,
          ),
          SizedBox(height: 16),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          SizedBox(height: 24),
          Text(
            "Steps",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          for (final step in meal.steps)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            )
        ]),
      ),
    );
  }
}
