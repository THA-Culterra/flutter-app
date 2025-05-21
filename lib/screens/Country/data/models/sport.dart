import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/CTCardData.dart';

class Sport implements CTCardData {
  Sport({
    required this.name,
    required this.nationalTeamYear,
    required this.trophies,
    required this.teamLogo,
    required this.imageUrl,
  });

  @override
  String imageUrl;

  @override
  String name;

  int nationalTeamYear;

  List<(String, int)> trophies;

  String teamLogo;

  /// Create a Sport object from Firestore-compatible map
  factory Sport.fromMap(Map<String, dynamic> map) {
    return Sport(
      name: map['name'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
      nationalTeamYear: map['nationalTeamYear'] as int? ?? 0,
      teamLogo: map['teamLogo'] as String? ?? '',
      trophies: (map['trophies'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((item) => (
      item['title'] as String? ?? '',
      item['year'] as int? ?? 0,
      ))
          .toList(),
    );
  }

  /// Create a Sport object from a Firestore DocumentSnapshot
  factory Sport.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Sport.fromMap(data);
  }

  /// Convert Sport object to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'nationalTeamYear': nationalTeamYear,
      'teamLogo': teamLogo,
      'trophies': trophies
          .map((trophy) => {'title': trophy.$1, 'year': trophy.$2})
          .toList(),
    };
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}
