import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';

import '../Data/review.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, required this.reviews});

  final List<Review> reviews;

  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._buildReviewListWithDividers(reviews),
          editorRow(
            imageUrl: user.photoURL,
            controller: commentController,
            onPost: () {
              print('Post content: ${commentController.text}');
            },
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
    return Row(
      children: [
        CircleAvatar(
          radius: 17,
          backgroundImage:
              review.author.photoURL != null &&
                      review.author.photoURL!.isNotEmpty
                  ? NetworkImage(review.author.photoURL!)
                  : null,
          child:
              (review.author.photoURL == null ||
                      review.author.photoURL!.isEmpty)
                  ? Icon(Icons.person, color: Colors.grey[700])
                  : null,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.author.displayName ?? "Anonymous",
              style: TextStyle(fontSize: 14, decoration: TextDecoration.none),
            ),
            Text(
              review.text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ],
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
            backgroundImage:
                imageUrl != null && imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : null,
            child:
                (imageUrl == null || imageUrl.isEmpty)
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
