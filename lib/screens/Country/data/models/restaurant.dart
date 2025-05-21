import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Data/review.dart';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.reviews,
  });

  final String id;
  final String name;
  final String city;
  final double latitude;
  final double longitude;
  final List<Review> reviews;

  /// Create Restaurant from Firestore-compatible map + document ID
  factory Restaurant.fromMap(Map<String, dynamic> map, {required String id}) {
    return Restaurant(
      id: id,
      name: map['name'] as String? ?? '',
      city: map['city'] as String? ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      reviews: [], // only filled during hydration
    );
  }

  /// Convert Restaurant to Firestore-compatible map (excluding reviews)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  /// Convert Restaurant to Firestore (alias for toMap)
  Map<String, dynamic> toFirestore() => toMap();

  /// Construct from DocumentSnapshot with hydrated reviews
  static Future<Restaurant> fromFirestoreWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final baseRestaurant = Restaurant.fromMap(data, id: doc.id);

    final reviewsSnap = await doc.reference.collection('reviews').get();
    final reviews = await Future.wait(
      reviewsSnap.docs.map(Review.fromFirestoreWithHydration),
    );

    return Restaurant(
      id: baseRestaurant.id,
      name: baseRestaurant.name,
      city: baseRestaurant.city,
      latitude: baseRestaurant.latitude,
      longitude: baseRestaurant.longitude,
      reviews: reviews,
    );
  }
}