import 'package:flutter/material.dart';

import 'main_drawer_page.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage(
      {Key? key, required this.currenFilter, required this.saveFilters})
      : super(key: key);

  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currenFilter;

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();

    _isGlutenFree = widget.currenFilter['gluten']!;
    _isLactoseFree = widget.currenFilter['lactose']!;
    _isVegan = widget.currenFilter['vegan']!;
    _isVegetarian = widget.currenFilter['vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      drawer: const MainDrawerPage(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Изменить настройки отображения',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    value: _isLactoseFree,
                    title: const Text('Лактоза'),
                    subtitle: const Text('Показывать рецепты без лактозы'),
                    onChanged: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    value: _isGlutenFree,
                    title: const Text('Глютен'),
                    subtitle: const Text('Показывать рецепты без глютена'),
                    onChanged: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    value: _isVegan,
                    title: const Text('Веган'),
                    subtitle: const Text('Показывать веган рецепты'),
                    onChanged: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    }),
                SwitchListTile(
                    value: _isVegetarian,
                    title: const Text('Вегетарианские'),
                    subtitle: const Text('Показывать вегетарианские рецепты'),
                    onChanged: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    }),
                ElevatedButton.icon(
                  onPressed: () {
                    final selecterFilter = {
                      'gluten': _isGlutenFree,
                      'lactose': _isLactoseFree,
                      'vegan': _isVegan,
                      'vegetarian': _isVegetarian,
                    };
                    widget.saveFilters(selecterFilter);
                  },
                  label: const Text('Сохранить'),
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
