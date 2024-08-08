import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screen/meal/components/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Oops!, there's nothing here",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Try Selecting another category",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
              ),
            ),
    );
  }
}
