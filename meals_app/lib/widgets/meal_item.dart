import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal});
  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealDeatilsScreen(
          meal: meal,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          onSelectMeal(context, meal);
        },
        child: Stack(
          // Placing widgets on top of each other
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              text: '${meal.duration} min'),
                          SizedBox(width: 12),
                          MealItemTrait(
                              icon: Icons.work, text: '$complexityText'),
                          SizedBox(width: 12),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              text: '$affordabilityText')
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
