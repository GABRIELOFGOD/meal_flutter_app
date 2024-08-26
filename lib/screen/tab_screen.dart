import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screen/category/category_view.dart';
import 'package:meals/screen/filter/filter_screen.dart';
import 'package:meals/screen/main_drawer.dart';
import 'package:meals/screen/meal/meal_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favouriteMeals = [];

  void _toggleFavouriteStatus(Meal meal) {
    bool mealExists = _favouriteMeals.contains(meal);
    if (mealExists) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      SnackBar(
          content: Text("${meal.title} is added to favourite successfully!"));
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
    }
  }

  void _setSelectedScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      addFavourite: _toggleFavouriteStatus,
    );
    String activeTitle = "Category";

    if (_selectedPageIndex == 1) {
      activeScreen = MealScreen(
        meals: _favouriteMeals,
        addFavourite: _toggleFavouriteStatus,
      );
      activeTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(
        onSelectedScreen: _setSelectedScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
        ],
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
      body: activeScreen,
    );
  }
}
