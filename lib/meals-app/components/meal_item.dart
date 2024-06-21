import 'package:flutter/material.dart';
import 'package:flutter_udemy/meals-app/components/meal_item_trait.dart';
import 'package:flutter_udemy/meals-app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  String _capitalizeEnumValue(String enumValue) {
    return enumValue.replaceRange(0, 1, enumValue[0].toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: _capitalizeEnumValue(meal.complexity.name),
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: _capitalizeEnumValue(meal.affordability.name),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
