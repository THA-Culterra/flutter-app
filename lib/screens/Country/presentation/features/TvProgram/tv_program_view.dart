import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Widgets/ct_card.dart';
import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:culterra/screens/Widgets/review_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:culterra/screens/Country/data/models/tv_show.dart';

import '../../../data/models/tv_program.dart';


class TvProgramView extends StatelessWidget {
  TvProgramView({super.key, required this.tvProgram});

  final TvProgram tvProgram;
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
              // TV Show image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  tvProgram.imageUrl,
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
                      tvProgram.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      "Top Cast",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: tvProgram.topActors.map((actor) {
                        return CTCard(data: actor);
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      "User Reviews",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),

                    if (tvProgram.reviews != null && tvProgram.reviews!.isNotEmpty)
                      ReviewCard(
                        reviews: tvProgram.reviews!,
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
        .collection('tv_programs')
        .doc(tvProgram.id)
        .collection('reviews')
        .add(reviewData);

    commentController.clear();
  }
}
