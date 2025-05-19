import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';

import 'tv_program.dart';

class TvShow implements TvProgram, CTCardData {
  TvShow({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;

  @override
  final String name;

  @override
  final String imageUrl;

  /// Create a TvShow from a Firestore-compatible map
  factory TvShow.fromMap(Map<String, dynamic> map) {
    return TvShow(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
    );
  }

  /// Convert TvShow to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  /// Create a TvShow from Firestore DocumentSnapshot
  factory TvShow.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TvShow.fromMap({
      ...data,
      'id': doc.id,
    });
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}
