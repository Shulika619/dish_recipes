import 'package:dish_recipes/const_categories_data.dart';
import 'package:flutter/material.dart';

import 'models/recipe.dart';
import 'pages/category_details_page.dart';
import 'pages/filters_page.dart';
import 'pages/recipe_datails_page.dart';
import 'pages/tabs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Ricepe> _avaliblePrcipe = kRecipeList;
  List<Ricepe> _favoritedRecipe = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avaliblePrcipe = kRecipeList.where((recipe) {
        if (_filters['gluten']! && !recipe.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !recipe.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !recipe.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !recipe.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavotire(String recipeId) {
    final existinIndex =
        _favoritedRecipe.indexWhere((recipe) => recipe.id == recipeId);
    if (existinIndex >= 0) {
      setState(() {
        _favoritedRecipe.removeAt(existinIndex);
      });
    } else {
      setState(() {
        _favoritedRecipe
            .add(kRecipeList.firstWhere((recipe) => recipe.id == recipeId));
      });
    }
  }

  bool _isRecipeFavorite(String id) {
    return _favoritedRecipe.any((recipe) => recipe.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рецепты блюд',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline1: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed',
                    color: Colors.white70),
                headline3: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed'),
              )),
      home: TabsPage(favoritedRecipe: _favoritedRecipe),
      routes: {
        CategoryDetailsPage.routeName: (context) =>
            CategoryDetailsPage(avalibleRecipe: _avaliblePrcipe),
        RecipeDetailsPage.routeName: (context) => RecipeDetailsPage(
            toogleFavorite: _toggleFavotire,
            isRecipeFavorite: _isRecipeFavorite),
        FiltersPage.routeName: (context) =>
            FiltersPage(currenFilter: _filters, saveFilters: _setFilters)
      },
      onUnknownRoute: (sittings) => MaterialPageRoute(
          builder: ((context) =>
              CategoryDetailsPage(avalibleRecipe: _avaliblePrcipe))),
    );
  }
}
