import 'package:cloud_firestore/cloud_firestore.dart';

class Cuisine {
  final List<DocumentReference> dishes;
  final List<DocumentReference> restaurants;

  Cuisine({
    required this.dishes,
    required this.restaurants,
  });

  /// Construct Cuisine from a Firestore-compatible map
  factory Cuisine.fromMap(Map<String, dynamic> map) {
    return Cuisine(
      dishes: (map['dishes'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
      restaurants: (map['restaurants'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
    );
  }

  /// Convert Cuisine to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'dishes': dishes,
      'restaurants': restaurants,
    };
  }

  /// Construct Cuisine from Firestore DocumentSnapshot
  factory Cuisine.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Cuisine.fromMap(data);
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}