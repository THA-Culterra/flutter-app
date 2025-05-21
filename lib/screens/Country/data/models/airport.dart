import 'package:cloud_firestore/cloud_firestore.dart';

class Airport {
  final String name;
  final String code;
  final String city;

  Airport({
    required this.name,
    required this.code,
    required this.city,
  });

  /// Create an Airport from a Firestore-compatible map
  factory Airport.fromMap(Map<String, dynamic> map) {
    return Airport(
      name: map['name'] as String? ?? '',
      code: map['code'] as String? ?? '',
      city: map['city'] as String? ?? '',
    );
  }

  /// Convert an Airport to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'city': city,
    };
  }

  /// Create an Airport from a Firestore document snapshot
  factory Airport.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Airport.fromMap(data);
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}