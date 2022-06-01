import 'package:flutter/material.dart';

import '../const_categories_data.dart';
import '../models/recipe.dart';
import 'recipe_datails_page.dart';

class CategoryDetailsPage extends StatelessWidget {
  static const routeName = '/category-details';

  final List<Ricepe> avalibleRecipe;

  const CategoryDetailsPage({Key? key, required this.avalibleRecipe})
      : super(key: key);

  void selectRecipe(BuildContext ctx, String recipeId) {
    Navigator.of(ctx)
        .pushNamed(RecipeDetailsPage.routeName, arguments: recipeId);
  }

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as int;
    final categoryTitle = kCategoriesList[routeArg].title;
    final categoryId = kCategoriesList[routeArg].id;
    final recipeFiltered = avalibleRecipe
        .where((recipe) => recipe.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemCount: recipeFiltered.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => selectRecipe(context, recipeFiltered[index].id),
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.network(recipeFiltered[index].imageUrl),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 20,
                        child: Container(
                          width: 250,
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Text(
                            recipeFiltered[index].title,
                            style: const TextStyle(
                                fontSize: 26, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 5),
                            Text('${recipeFiltered[index].duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(recipeFiltered[index]
                                .lvl
                                .toString()
                                .split('.')
                                .last)
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 5),
                            Text(recipeFiltered[index]
                                .price
                                .toString()
                                .split('.')
                                .last)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
