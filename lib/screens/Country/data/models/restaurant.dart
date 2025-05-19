import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String name;
  final String city;
  final double latitude;
  final double longitude;

  /// Create Restaurant from Firestore-compatible map + document ID
  factory Restaurant.fromMap(Map<String, dynamic> map, {required String id}) {
    return Restaurant(
      id: id,
      name: map['name'] as String? ?? '',
      city: map['city'] as String? ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }

  /// Convert Restaurant to Firestore-compatible map (excluding ID)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  /// Create Restaurant from Firestore document snapshot
  factory Restaurant.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Restaurant.fromMap(data, id: doc.id);
  }

  /// Convert Restaurant to Firestore (alias for toMap)
  Map<String, dynamic> toFirestore() => toMap();
}