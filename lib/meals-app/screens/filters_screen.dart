import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/components/filter_tile.dart';

enum Filter { glutenfree, lactosefree, vegan, vegetarian }

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> selectedFilters;
  const FiltersScreen({super.key, required this.selectedFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenfree = widget.selectedFilters[Filter.glutenfree] ?? false;
    _lactosefree = widget.selectedFilters[Filter.lactosefree] ?? false;
    _vegan = widget.selectedFilters[Filter.vegan] ?? false;
    _vegetarian = widget.selectedFilters[Filter.vegetarian] ?? false;
    super.initState();
  }

  void updateFilters(String filter) {
    switch (filter) {
      case 'Glutenfree':
        setState(() {
          _glutenfree = !_glutenfree;
        });
        break;
      case 'Lactosefree':
        setState(() {
          _lactosefree = !_lactosefree;
        });
        break;
      case 'Vegan':
        setState(() {
          _vegan = !_vegan;
        });
        break;
      case 'Vegetarian':
        setState(() {
          _vegetarian = !_vegetarian;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenfree,
            Filter.lactosefree: _lactosefree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
        },
        child: Column(
          children: [
            FilterSwitchTile(
              filterToggled: _glutenfree,
              onChanged: (filter) {
                updateFilters(filter);
              },
              type: 'Glutenfree',
              subtitle: 'Only include glutenfree meals.',
            ),
            FilterSwitchTile(
              filterToggled: _lactosefree,
              onChanged: (filter) {
                updateFilters(filter);
              },
              type: 'Lactosefree',
              subtitle: 'Only include lactosefree meals.',
            ),
            FilterSwitchTile(
              filterToggled: _vegan,
              onChanged: (filter) {
                updateFilters(filter);
              },
              type: 'Vegan',
              subtitle: 'Only include vegan meals.',
            ),
            FilterSwitchTile(
              filterToggled: _vegetarian,
              onChanged: (filter) {
                updateFilters(filter);
              },
              type: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
            ),
          ],
        ),
      ),
    );
  }
}
