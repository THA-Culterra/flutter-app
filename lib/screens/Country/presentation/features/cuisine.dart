import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/labeled_link.dart';
import '../../data/models/cuisine.dart';

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
              rowBuilder("Top Dishes"),

              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TasteAtlas Rewards",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      )
                  ),
                  rankedImageWidget(
                    imagePath: "lib/core/assets/atlas_sample.png",
                    ranking: 1,
                  )
                ],
              ),

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

  Widget rankedImageWidget({
    required String imagePath,
    required int ranking,
  }) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Background image
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient overlay
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            // Top-left SVG icon
            Positioned(
              top: 8,
              left: 8,
              child: SvgPicture.asset(
                '/lib/core/assets/taste_atlas_logo.svg',
                width: 92,
                height: 34,
              ),
            ),
            // Bottom-right ranking text
            Positioned(
              bottom: 8,
              right: 8,
              child: Text(
                "#$ranking",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget rowBuilder(String title) {
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
              itemCount: cuisine.dishes.length,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) => CTCard(data: cuisine.dishes[index]),
            ),
          )
      ]);
  }
}