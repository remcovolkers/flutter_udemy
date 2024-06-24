import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy/meals-app/components/filter_tile.dart';
import 'package:flutter_udemy/meals-app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);
    _glutenfree = activeFilters[Filter.glutenfree] ?? false;
    _lactosefree = activeFilters[Filter.lactosefree] ?? false;
    _vegan = activeFilters[Filter.vegan] ?? false;
    _vegetarian = activeFilters[Filter.vegetarian] ?? false;
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
        onPopInvoked: (bool didPop) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenfree: _glutenfree,
            Filter.lactosefree: _lactosefree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan
          });
          if (didPop) return;
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
