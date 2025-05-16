import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/labeled_link.dart';
import '../../data/models/cuisine.dart';
import '../../data/models/dish.dart';
import 'Dish/dish_view.dart';

class CuisineScreen extends StatelessWidget {
  const CuisineScreen({super.key, required this.cuisine});

  final Cuisine cuisine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              rowBuilder("Top Dishes", cuisine.dishes),

              // Column(
              //   spacing: 8,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("TasteAtlas Rewards",
              //         style: TextStyle(
              //           fontSize: 16,
              //           color: Colors.grey[800],
              //           fontWeight: FontWeight.w700,
              //           decoration: TextDecoration.none,
              //         )
              //     ),
              //     rankedImageWidget(
              //       imagePath: "lib/core/assets/atlas_sample.png",
              //       ranking: 1,
              //     )
              //   ],
              // ),

              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Iconic Traditional Restaurants",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      )
                  ),
                  Column(
                    spacing: 16,
                    children: cuisine.restaurants.map((restaurant) {
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
              ),
            ],
          ),
        ),

        ReportSuggestion()
      ],
    );
  }

  Widget rowBuilder(String title, List<Dish> dishes) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          )
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dishes.length,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                final dish = dishes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DishView(dish: dish),
                      ),
                    );
                  },
                  child: CTCard(data: dish),
                );
              },
            ),
          )
      ]);
  }
}