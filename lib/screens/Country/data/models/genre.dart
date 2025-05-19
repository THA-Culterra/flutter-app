import 'package:culterra/screens/Country/data/models/song.dart';

import '../../../Data/review.dart';
import '../../domain/entities/CTCardData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Genre implements CTCardData {
  Genre({
    required this.name,
    required this.imageUrl,
    required this.topSongs,
    required this.reviews,
  });

  @override
  final String name;
  @override
  final String imageUrl;
  final List<Song> topSongs;
  final List<Review> reviews;

  static Future<Genre> fromMapWithHydration(Map<String, dynamic> map) async {
    final songRefs = (map['topSongs'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final reviewRefs = (map['reviews'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final topSongs = await Future.wait(songRefs.map((ref) async {
      final doc = await ref.get();
      return Song.fromFirestore(doc);
    }));

    final reviews = await Future.wait(reviewRefs.map((ref) async {
      final doc = await ref.get();
      return Review.fromFirestore(doc);
    }));

    return Genre(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      topSongs: topSongs,
      reviews: reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'topSongs': topSongs.map((s) => FirebaseFirestore.instance.doc('songs/${s.id}')).toList(),
      'reviews': reviews.map((r) => FirebaseFirestore.instance.doc('reviews/${r.id}')).toList(),
    };
  }
}