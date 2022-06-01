import 'package:flutter/material.dart';

import '../models/recipe.dart';
import 'categories_page.dart';
import 'favorits_page.dart';
import 'main_drawer_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key, required this.favoritedRecipe}) : super(key: key);

  final List<Ricepe> favoritedRecipe;

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const CategoriesPage(), 'title': 'Категории'},
      {
        'page': FavoritsPage(favoritedRecipe: widget.favoritedRecipe),
        'title': 'Избранное'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      drawer: const MainDrawerPage(),
      body: SafeArea(child: _pages[_selectedPageIndex]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: "Категории",
            ),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.favorite),
                label: "Избранное"),
          ]),
    );
  }
}
