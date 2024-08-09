import "package:flutter/material.dart";
import "package:meals/models/category_model.dart";
import "package:meals/models/meal_model.dart";
import "package:meals/screen/category/components/category_grid_item.dart";
import "package:meals/data/dummy_data.dart";
import "package:meals/screen/meal/meal_screen.dart";

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,  required this.addFavourite,});
  final void Function(Meal meal) addFavourite;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((Meal meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealScreen(title: category.title, meals: filteredMeal, addFavourite: addFavourite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            selectedCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
