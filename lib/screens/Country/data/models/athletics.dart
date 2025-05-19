import 'package:cloud_firestore/cloud_firestore.dart';

class Athletics {
  Athletics({
    required this.popularSports,
    required this.athletes,
  });

  final List<DocumentReference> popularSports;
  final List<DocumentReference> athletes;

  /// Create Athletics object from Firestore DocumentSnapshot
  factory Athletics.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Athletics.fromMap(data);
  }

  /// Create Athletics object from Map
  factory Athletics.fromMap(Map<String, dynamic> map) {
    return Athletics(
      popularSports: (map['popularSports'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
      athletes: (map['athletes'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
    );
  }

  /// Convert Athletics object to Map
  Map<String, dynamic> toMap() {
    return {
      'popularSports': popularSports,
      'athletes': athletes,
    };
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}