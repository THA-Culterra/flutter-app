import 'package:cloud_firestore/cloud_firestore.dart';

class Cinema {
  Cinema({
    required this.topMovies,
    required this.topTvShows,
    required this.famousActors,
    required this.directors,
  });

  final List<DocumentReference> topMovies;
  final List<DocumentReference> topTvShows;
  final List<DocumentReference> famousActors;
  final List<DocumentReference> directors;

  /// Create a Cinema object from a Firestore-compatible map
  factory Cinema.fromMap(Map<String, dynamic> map) {
    return Cinema(
      topMovies: (map['topMovies'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
      topTvShows: (map['topTvShows'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
      famousActors: (map['famousActors'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
      directors: (map['directors'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
    );
  }

  /// Convert Cinema object to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'topMovies': topMovies,
      'topTvShows': topTvShows,
      'famousActors': famousActors,
      'directors': directors,
    };
  }

  /// Create a Cinema object from Firestore DocumentSnapshot
  factory Cinema.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Cinema.fromMap(data);
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}