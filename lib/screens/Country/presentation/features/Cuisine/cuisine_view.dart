import 'package:culterra/screens/Country/presentation/features/Restaurant/restaurant_view.dart';
import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';

import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/labeled_link.dart';
import '../../../data/models/cuisine.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../Dish/dish_view.dart';

class CuisineScreen extends StatelessWidget {
  const CuisineScreen({super.key, required this.cuisine});

  final Cuisine cuisine;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowBuilder("Top Dishes", cuisine.dishes),
          const SizedBox(height: 24),
          restaurantSection(context, cuisine.restaurants),
          const SizedBox(height: 24),
          const ReportSuggestion(),
        ],
      ),
    );
  }

  Widget rowBuilder(String title, List<Dish> dishes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dishes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final dish = dishes[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DishView(dish: dish),
                  ),
                ),
                child: CTCard(data: dish),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget restaurantSection(BuildContext context, List<Restaurant> restaurants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Iconic Traditional Restaurants",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: restaurants.map((restaurant) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantView(restaurant: restaurant),
                ),
              ),
              child: LabeledLink(
                link: '', // Add your link here if needed
                primLabel: restaurant.name,
                secLabel: restaurant.city,
                icon: 'pin',
                imagePath: restaurant.imageUrl,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}