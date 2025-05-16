import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:culterra/screens/Widgets/review_card.dart';
import 'package:flutter/Material.dart';

import '../../../data/models/dish.dart';

class DishView extends StatelessWidget {
  DishView({super.key, required this.dish});

  final Dish dish;

  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image at the top
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Stack(
                  children: [
                    Image.network(
                      dish.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 58,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,        // solid white at the bottom
                              Colors.white54,      // semi-transparent in the middle
                              Colors.transparent,  // fully transparent at the top
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      
              // Content below image
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and category
                    Text(
                        dish.name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none
                        )
                    ),
                    Text(
                        dish.mealType.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            decoration: TextDecoration.none
                        )
                    ),
      
                    // Description
                    Text(
                      dish.description,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          decoration: TextDecoration.none
                      ),
                    ),
      
                    // Expert reviews
                    const Text(
                        "Expert reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none
                        )
                    ),
      
                    // Review card container
                    ReviewCard(reviews: dish.reviews, controller: commentController, onPost: () {
                      print(commentController.text);
                      commentController.clear();
                      FocusScope.of(context).unfocus();
                    }),
                  ],
                ),
              ),

              ReportSuggestion()
            ],
          ),
        ),
      ),
    );;
  }
}
