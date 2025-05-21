import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Data/review.dart';
import '../../domain/entities/CTCardData.dart';
import 'actor.dart';
import 'tv_program.dart';


class Movie implements TvProgram, CTCardData {
  Movie({
    required this.id,
    required this.topActors,
    required this.reviews,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final List<Actor> topActors;
  final List<Review> reviews;

  @override
  final String name;

  @override
  final String imageUrl;

  /// This is for usage after full hydration.
  static Future<Movie> fromMapWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final id = doc.id;

    final actorRefs = (data['topActors'] as List).cast<DocumentReference>();

    final topActors = await Future.wait(actorRefs.map((ref) async {
      final doc = await ref.get();
      return Actor.fromFirestore(doc);
    }));

    // Load reviews from the 'reviews' subcollection of this TvShow document
    final reviewSnapshot = await doc.reference.collection('reviews').get();
    final reviews = await Future.wait(
      reviewSnapshot.docs.map(Review.fromFirestoreWithHydration),
    );

    return Movie(
      id: id,
      name: data['name'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      topActors: topActors,
      reviews: reviews,
    );
  }
}