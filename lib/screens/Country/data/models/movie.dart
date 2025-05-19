import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/CTCardData.dart';
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
  final List<DocumentReference> topActors;
  final List<DocumentReference> reviews;

  @override
  final String name;

  @override
  final String imageUrl;

  /// Create a Movie object from a Firestore-compatible map
  factory Movie.fromMap(Map<String, dynamic> map, {required String id}) {
    return Movie(
      id: id,
      name: map['name'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
      topActors: (map['topActors'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
      reviews: (map['reviews'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
    );
  }

  /// Construct Movie from Firestore DocumentSnapshot
  factory Movie.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Movie.fromMap(data, id: doc.id);
  }

  /// Convert Movie object to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'topActors': topActors,
      'reviews': reviews,
    };
  }

  /// Convert Movie to Firestore (alias for toMap)
  Map<String, dynamic> toFirestore() => toMap();
}