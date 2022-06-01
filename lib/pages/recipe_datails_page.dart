import 'package:flutter/material.dart';

import '../const_categories_data.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage(
      {Key? key, required this.toogleFavorite, required this.isRecipeFavorite})
      : super(key: key);

  static const routeName = '/recipe-details';
  final Function toogleFavorite;
  final Function isRecipeFavorite;

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedRecipe =
        kRecipeList.firstWhere((element) => element.id == recipeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Image.network(selectedRecipe.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context, "Ингредиенты"),
            buildContainerIngredients(selectedRecipe.ingredients),
            buildSectionTitle(context, "Шаги"),
            buildContainerSteps(selectedRecipe.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child:
              Icon(isRecipeFavorite(recipeId) ? Icons.star : Icons.star_border),
          onPressed: () => toogleFavorite(recipeId)),
    );
  }

  Widget buildContainerIngredients(List<String> ingr) {
    return SizedBox(
      width: 300,
      // height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: ingr.length,
          itemBuilder: ((context, index) {
            return Card(
              color: Colors.amber,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(ingr[index]),
              ),
            );
          })),
    );
  }
}

Widget buildContainerSteps(List<String> stps) {
  return SizedBox(
    width: 300,
    // height: 300,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: stps.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(stps[index]),
          );
        })),
  );
}

Widget buildSectionTitle(BuildContext context, String title) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Text('$title:', style: Theme.of(context).textTheme.headline3),
  );
}
