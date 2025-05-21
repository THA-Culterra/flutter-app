import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:culterra/screens/Widgets/review_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                        onPost: postReview,
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

  Future<void> postReview() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final reviewText = commentController.text.trim();
    if (reviewText.isEmpty) return;

    final reviewData = {
      'author': FirebaseFirestore.instance.collection('users').doc(user.uid),
      'text': reviewText,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('dishes')
        .doc(dish.id)
        .collection('reviews')
        .add(reviewData);

    commentController.clear();
  }
}
