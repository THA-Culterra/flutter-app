import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/data/models/CulterraUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';

import '../Country/data/models/role.dart';
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

  Future<CulterraUser?> getUser(String id) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get();
      return CulterraUser.fromFirestore(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CulterraUser?>(
      future: getUser(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Text("Could not load user data.");
        }

        final user = snapshot.data!;

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
              if (user.role == Role.cuisine)
                editorRow(
                  imageUrl: user.photoURL,
                  controller: controller,
                  onPost: onPost,
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildReviewListWithDividers(List<Review> reviews) {
    return reviews
        .map((review) => reviewRow(review))
        .expand((widget) => [widget, const Divider()])
        .toList();
  }

  Widget reviewRow(Review review) {
    return FutureBuilder<CulterraUser?>(
      future: getUser(review.authorId),
      builder: (context, snapshot) {
        final user = snapshot.data;
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 17,
                backgroundImage:
                    user?.photoURL != null && user!.photoURL!.isNotEmpty
                        ? NetworkImage(user.photoURL!)
                        : null,
                child:
                    (user?.photoURL == null)
                        ? Icon(Icons.person, color: Colors.grey[700])
                        : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.displayName ?? "Anonymous",
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
      },
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
