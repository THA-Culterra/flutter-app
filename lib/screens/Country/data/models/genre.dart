import 'package:culterra/screens/Country/data/models/song.dart';

import '../../../Data/review.dart';
import '../../domain/entities/CTCardData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Genre implements CTCardData {
  Genre({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.topSongs,
    required this.reviews,
  });

  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  final List<Song> topSongs;
  final List<Review>? reviews;

  /// From Firestore document (with hydration of topSongs and reviews)
  static Future<Genre> fromFirestoreWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;

    // Hydrate topSongs from references
    final topSongRefs = (data['topSongs'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final topSongs = await Future.wait(
      topSongRefs.map((ref) async {
        final songDoc = await ref.get();
        return Song.fromFirestoreWithHydration(songDoc);
      }),
    );

    // Hydrate reviews from subcollection
    final reviewSnapshots = await doc.reference.collection('reviews').get();
    final reviews = await Future.wait(
      reviewSnapshots.docs.map((d) => Review.fromFirestoreWithHydration(d)),
    );

    return Genre(
      id: doc.id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      topSongs: topSongs,
      reviews: reviews,
    );
  }

  /// From Firestore document without hydration
  factory Genre.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Genre(
      id: doc.id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      topSongs: [], // No hydration
      reviews: [],  // No hydration
    );
  }

  /// To Firestore (stores references to topSongs only, not reviews)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'topSongs': topSongs.map((s) => FirebaseFirestore.instance.doc('songs/${s.id}')).toList(),
    };
  }

  Map<String, dynamic> toFirestore() => toMap();
}