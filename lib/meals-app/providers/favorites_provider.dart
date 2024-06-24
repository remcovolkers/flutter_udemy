import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy/meals-app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavorite(Meal meal) {
    if (!state.contains(meal)) {
      state = [...state, meal];
      return true;
    } else {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
  }
}

final StateNotifierProvider<FavoriteMealsNotifier, List<Meal>> favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (StateNotifierProviderRef<FavoriteMealsNotifier, List<Meal>> ref) {
    return FavoriteMealsNotifier();
  },
);
