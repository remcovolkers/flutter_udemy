import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy/meals-app/components/filter_tile.dart';
import 'package:flutter_udemy/meals-app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  void updateFilters(String filter, bool isChecked, WidgetRef ref) {
    switch (filter) {
      case 'Glutenfree':
        ref.read(filtersProvider.notifier).setFilter(Filter.glutenfree, isChecked);
        break;
      case 'Lactosefree':
        ref.read(filtersProvider.notifier).setFilter(Filter.lactosefree, isChecked);
        break;
      case 'Vegan':
        ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
        break;
      case 'Vegetarian':
        ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<Filter, bool> filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchTile(
            filterToggled: filters[Filter.glutenfree]!,
            onChanged: (filter, isChecked) {
              updateFilters(filter, isChecked, ref);
            },
            type: 'Glutenfree',
            subtitle: 'Only include glutenfree meals.',
          ),
          FilterSwitchTile(
            filterToggled: filters[Filter.lactosefree]!,
            onChanged: (filter, isChecked) {
              updateFilters(filter, isChecked, ref);
            },
            type: 'Lactosefree',
            subtitle: 'Only include lactosefree meals.',
          ),
          FilterSwitchTile(
            filterToggled: filters[Filter.vegan]!,
            onChanged: (filter, isChecked) {
              updateFilters(filter, isChecked, ref);
            },
            type: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
          FilterSwitchTile(
            filterToggled: filters[Filter.vegetarian]!,
            onChanged: (filter, isChecked) {
              updateFilters(filter, isChecked, ref);
            },
            type: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
        ],
      ),
    );
  }
}
