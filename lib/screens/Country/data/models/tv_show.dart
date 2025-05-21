import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';

import '../../../Data/review.dart';
import 'actor.dart';
import 'tv_program.dart';

class TvShow implements TvProgram, CTCardData {
  TvShow({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.topActors,
    required this.reviews,
  });

  final String id;

  @override
  final String name;

  @override
  final String imageUrl;

  final List<Actor> topActors;
  final List<Review> reviews;

  /// Hydrated factory that loads Actor and Review objects
  static Future<TvShow> fromMapWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;

    // Hydrate topActors from stored references
    final actorRefs = (data['topActors'] as List?)?.cast<DocumentReference>() ?? [];
    final topActors = await Future.wait(actorRefs.map((ref) async {
      final actorDoc = await ref.get();
      return Actor.fromFirestore(actorDoc);
    }));

    // Load reviews from the 'reviews' subcollection of this TvShow document
    final reviewSnapshot = await doc.reference.collection('reviews').get();
    final reviews = await Future.wait(
      reviewSnapshot.docs.map(Review.fromFirestoreWithHydration),
    );

    return TvShow(
      id: doc.id,
      name: data['name'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      topActors: topActors,
      reviews: reviews,
    );
  }
}