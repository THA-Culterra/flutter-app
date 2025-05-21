import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';

import '../Data/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviews,
    required this.controller,
    required this.onPost,
  });

  final List<Review> reviews;
  final TextEditingController controller;
  final VoidCallback onPost;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Text("User not authenticated.");
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._buildReviewListWithDividers(reviews),
          const SizedBox(height: 8),
          if (FirebaseAuth.instance.currentUser != null) // Assuming only cuisine role should post
            editorRow(
              imageUrl: FirebaseAuth.instance.currentUser!.photoURL,
              controller: controller,
              onPost: onPost,
            ),
        ],
      ),
    );
  }

  List<Widget> _buildReviewListWithDividers(List<Review> reviews) {
    return reviews
        .map((review) => reviewRow(review))
        .expand((widget) => [widget, const Divider()])
        .toList();
  }

  Widget reviewRow(Review review) {
    final author = review.author;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 17,
            backgroundImage: author.photoUrl.isNotEmpty
                ? NetworkImage(author.photoUrl)
                : null,
            child: author.photoUrl.isEmpty
                ? Icon(Icons.person, color: Colors.grey[700])
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author.name,
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  review.text,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget editorRow({
    required String? imageUrl,
    required TextEditingController controller,
    required VoidCallback onPost,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                ? NetworkImage(imageUrl)
                : null,
            child: (imageUrl == null || imageUrl.isEmpty)
                ? Icon(Icons.person, color: Colors.grey[700])
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Write a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onPost,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}