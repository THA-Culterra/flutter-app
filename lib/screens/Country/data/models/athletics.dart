import 'package:cloud_firestore/cloud_firestore.dart';

import 'athlete.dart';
import 'sport.dart';

class Athletics {
  Athletics({
    required this.popularSports,
    required this.athletes,
  });

  final List<Sport> popularSports;
  final List<Athlete> athletes;

  /// Construct Athletics from a Firestore-compatible map
  static Future<Athletics> fromMapWithHydration(Map<String, dynamic> map) async {
    // Directly deserialize embedded sports
    final popularSportsData = (map['popularSports'] as List<dynamic>?)
        ?.whereType<Map<String, dynamic>>()
        .toList() ?? [];

    final popularSports = popularSportsData
        .map((sportMap) => Sport.fromMap(sportMap))
        .toList();

    // Hydrate athletes from DocumentReferences
    final athleteRefs = (map['athletes'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    final athletes = await Future.wait(
      athleteRefs.map((ref) async {
        final doc = await ref.get();
        return Athlete.fromFirestore(doc);
      }),
    );

    return Athletics(
      popularSports: popularSports,
      athletes: athletes,
    );
  }

  /// Factory from Firestore DocumentSnapshot that hydrates directly
  static Future<Athletics> fromFirestore(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    return await Athletics.fromMapWithHydration(data);
  }

  /// Convert to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'popularSports': popularSports.map((sport) => sport.toMap()).toList(),
      'athletes': athletes.map((a) => FirebaseFirestore.instance
          .collection('athletes')
          .doc(a.id)), // assuming athlete still stored as reference
    };
  }

  Map<String, dynamic> toFirestore() => toMap();
}