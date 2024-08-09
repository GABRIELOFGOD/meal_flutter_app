import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.addFavourite,
  });

  final Meal meal;
  final void Function(Meal meal) addFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          GestureDetector(
            onTap: () {
              addFavourite(meal);
            },
            child: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Image.network(
          meal.imageUrl,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Ingredents",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (final ingredient in meal.ingredients)
          Text(
            ingredient,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Steps",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (final ingredient in meal.steps)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              ingredient,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
      ])),
    );
  }
}
