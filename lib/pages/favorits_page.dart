import 'package:flutter/material.dart';

import '../models/recipe.dart';

class FavoritsPage extends StatelessWidget {
  const FavoritsPage({Key? key, required this.favoritedRecipe})
      : super(key: key);

  final List<Ricepe> favoritedRecipe;
  // final Function toogleFavorite;

  @override
  Widget build(BuildContext context) {
    if (favoritedRecipe.isEmpty) {
      return Container(
        child: const Text('Список избранных рецептов пуст!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoritedRecipe.length,
        itemBuilder: (context, index) {
          return InkWell(
            // onTap: () => selectRecipe(context, favoritedRecipe[index].id),
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
                        child: Image.network(favoritedRecipe[index].imageUrl),
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
                            favoritedRecipe[index].title,
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
                            Text('${favoritedRecipe[index].duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(favoritedRecipe[index]
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
                            Text(favoritedRecipe[index]
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
      );
    }
  }
}
