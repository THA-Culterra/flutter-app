import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/labeled_link.dart';
import '../../../data/models/cuisine.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../Dish/dish_view.dart';
import 'cuisine_view_model.dart';

class CuisineScreen extends StatelessWidget {
  const CuisineScreen({super.key, required this.cuisine});
  final Cuisine cuisine;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CuisineViewModel(cuisine: cuisine),
      child: const CuisineContent(),
    );
  }
}

class CuisineContent extends StatelessWidget {
  const CuisineContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CuisineViewModel>();
    final state = viewModel.uiState;

    if (state is UiLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is UiError) {
      return Center(child: Text('Error: ${state.toString()}'));
    }

    final (dishes, restaurants) = (state as UiSuccess<(List<Dish>, List<Restaurant>)>).data;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            rowBuilder("Top Dishes", dishes),
            restaurantSection(restaurants),
            const ReportSuggestion()
          ],
        ),
      ),
    );
  }

  Widget rowBuilder(String title, List<Dish> dishes) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            )),
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
                    builder: (_) => DishView(dishId: dish.id),
                  ),
                ),
                child: CTCard(data: dish),
              );
            },
          ),
        )
      ],
    );
  }

  Widget restaurantSection(List<Restaurant> restaurants) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Iconic Traditional Restaurants",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            )),
        Column(
          spacing: 16,
          children: restaurants.map((restaurant) {
            return LabeledLink(
              link: '',
              primLabel: restaurant.name,
              secLabel: restaurant.city,
              icon: 'pin',
              imagePath: 'lib/core/assets/restau_placeholder.png',
            );
          }).toList(),
        ),
      ],
    );
  }
}