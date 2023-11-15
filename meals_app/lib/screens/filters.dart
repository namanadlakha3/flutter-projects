import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegan,
  Vegetarian,
}

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  _FilterScreenState();

  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVeg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {},
            ),
          ],
        ),
        // drawer: MainDrawer(
        //   setScreen: (screen) {
        //     Navigator.of(context).pop();
        //     if (screen == 'meals') {
        //       Navigator.of(context)
        //           .pushReplacement(MaterialPageRoute(builder: (context) {
        //         return TabScreen();
        //       }));
        //     }
        //   },
        // ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.GlutenFree: isGlutenFree,
              Filter.LactoseFree: isLactoseFree,
              Filter.Vegan: isVegan,
              Filter.Vegetarian: isVeg,
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                value: isGlutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    isGlutenFree = isChecked;
                  });
                },
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Gluten free meals",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: isGlutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    isLactoseFree = isChecked;
                  });
                },
                title: Text(
                  "Lactose-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Lactose free meals",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: isGlutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    isVegan = isChecked;
                  });
                },
                title: Text(
                  "Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only Vegan meals",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: isGlutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    isVeg = isChecked;
                  });
                },
                title: Text(
                  "Vegetarian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Vegetarian meals",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              )
            ],
          ),
        ));
  }
}
