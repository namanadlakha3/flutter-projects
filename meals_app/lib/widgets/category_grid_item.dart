import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';

import '../models/cateogry.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.selectCategory});
  final Category category;
  final Function(BuildContext, String, String) selectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context, category.id, category.title);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: theme.colorScheme.onBackground)),
      ),
    );
  }
}
