import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  _TabScreenState();

  int selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];
  final allMeals = dummyMeals;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
        showInfoMessage('Removed from favorites');
      });
    } else {
      setState(() {
        favoriteMeals.add(allMeals.firstWhere((meal) => meal.id == mealId));
        showInfoMessage('Added to favorites');
      });
    }
  }

  void setScreen(String value) async {
    Navigator.of(context).pop();

    if (value == "filters") {
      final appliedFilters = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return FilterScreen();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = 'Categories';
    Widget activePage = CategoriesScreen(toggleFavorite: toggleFavorite);

    if (selectedPageIndex == 1) {
      title = 'Favorites';
      activePage =
          MealScreen(meals: favoriteMeals, toggleFavorite: toggleFavorite);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: MainDrawer(setScreen: setScreen),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ));
  }
}
