import 'package:flutter/material.dart';

class FilterSwitchTile extends StatelessWidget {
  final Function(String filter) onChanged;
  final bool filterToggled;
  final String type;
  final String subtitle;

  const FilterSwitchTile({
    super.key,
    required this.filterToggled,
    required this.onChanged,
    required this.type,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterToggled,
      onChanged: (isChecked) {
        onChanged(type);
      },
      title: Text(
        type,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 32, right: 24),
    );
  }
}
