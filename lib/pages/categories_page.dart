import 'package:flutter/material.dart';

import '../const_categories_data.dart';
import 'category_details_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  void selectCategory(BuildContext ctx, int id) {
    Navigator.of(ctx).pushNamed(CategoryDetailsPage.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        itemCount: kCategoriesList.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            onTap: () => selectCategory(context, index),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      kCategoriesList[index].color.withOpacity(0.7),
                      kCategoriesList[index].color
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(kCategoriesList[index].title,
                    style: Theme.of(context).textTheme.headline3)),
          );
        },
      ),
    );
  }
}
