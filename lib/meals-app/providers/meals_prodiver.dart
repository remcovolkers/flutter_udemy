import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy/meals-app/data/dummy_data.dart';

final mealsProvider = Provider((ProviderRef ref) {
  return dummyMeals;
});
