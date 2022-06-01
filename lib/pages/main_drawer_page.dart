import 'package:flutter/material.dart';

import 'filters_page.dart';

class MainDrawerPage extends StatelessWidget {
  const MainDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            color: Colors.amber,
            child: Text('Ням-ням !',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.restaurant, size: 26),
            title: const Text("Рецепты",
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 26),
            title: const Text(
              'Настройки',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
            },
          )
        ],
      ),
    );
  }
}
