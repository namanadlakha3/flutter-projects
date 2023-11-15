import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key, required this.title, required this.meals});
  String title;
  List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index]);
        });
    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No meals found",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(height: 16),
          Text("Try selecting a different category",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
