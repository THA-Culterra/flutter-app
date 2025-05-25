import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:culterra/screens/Widgets/review_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/restaurant.dart';

class RestaurantView extends StatelessWidget {
  RestaurantView({super.key, required this.restaurant});

  final Restaurant restaurant;
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  restaurant.imageUrl,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              restaurant.city,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            final googleMapsUrl = Uri.parse(
                              'https://www.google.com/maps/search/?api=1&query=$restaurant.latitude,$restaurant.longitude',
                            );

                            if (await canLaunchUrl(googleMapsUrl)) {
                              await launchUrl(
                                googleMapsUrl,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              debugPrint('Could not launch Google Maps');
                            }
                          },
                          child: buildLocationCircle(
                            assetPath: 'lib/core/assets/location-up.svg',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      restaurant.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Expert reviews",
                      style: TextStyle(fontSize: 16),
                    ),

                    if (restaurant.reviews != null &&
                        restaurant.reviews!.isNotEmpty)
                      ReviewCard(
                        reviews: restaurant.reviews!,
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
        .collection('restaurants')
        .doc(restaurant.id)
        .collection('reviews')
        .add(reviewData);

    commentController.clear();
  }

  Widget buildLocationCircle({required String assetPath, double size = 24.0}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        color: Color(0xFF8200D2), // #8200D2
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
