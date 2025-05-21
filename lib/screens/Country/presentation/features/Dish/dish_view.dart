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
              // Dish image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  dish.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dish.mealType.name,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      dish.description,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    const Text("Expert reviews", style: TextStyle(fontSize: 16)),

                    if (dish.reviews != null && dish.reviews!.isNotEmpty)
                      ReviewCard(
                        reviews: dish.reviews!,
                        controller: commentController,
                        onPost: () {
                          // If you're keeping posting logic, this should be connected to a ViewModel or callback
                        },
                      )
                    else
                      const Text("No reviews yet."),
                  ],
                ),
              ),

              ReportSuggestion(),
            ],
          ),
        ),
      ),
    );
  }
}
