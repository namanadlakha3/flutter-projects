import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals.dart';

import '../data/dummy_data.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.toggleFavorite});

  void Function(String) toggleFavorite;

  void selectCategory(BuildContext context, String id, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealScreen(
          toggleFavorite: toggleFavorite,
          title: title,
          meals:
              dummyMeals.where((meal) => meal.categories.contains(id)).toList(),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(category: category, selectCategory: selectCategory),
      ],
    );
  }
}
