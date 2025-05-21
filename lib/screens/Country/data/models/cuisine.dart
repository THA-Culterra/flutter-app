import 'package:cloud_firestore/cloud_firestore.dart';

import 'restaurant.dart';
import 'dish.dart';

class Cuisine {
  final List<Dish> dishes;
  final List<Restaurant> restaurants;

  Cuisine({
    required this.dishes,
    required this.restaurants,
  });

  /// Construct Cuisine from a Firestore-compatible map WITHOUT hydration
  factory Cuisine.fromMap(Map<String, dynamic> map) {
    return Cuisine(
      dishes: [], // Hydrated dishes not available here
      restaurants: [], // Hydrated restaurants not available here
    );
  }

  /// Convert Cuisine to a Firestore-compatible map with references
  Map<String, dynamic> toMap() {
    return {
      'dishes': dishes.map((d) => FirebaseFirestore.instance.doc('dishes/${d.id}')).toList(),
      'restaurants': restaurants.map((r) => FirebaseFirestore.instance.doc('restaurants/${r.id}')).toList(),
    };
  }

  /// Construct Cuisine from Firestore DocumentSnapshot without hydration
  factory Cuisine.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Cuisine.fromMap(data);
  }

  /// Hydrated constructor
  static Future<Cuisine> fromMapWithHydration(Map<String, dynamic> map) async {
    final dishRefs = (map['dishes'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    final restaurantRefs = (map['restaurants'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    // Fetch dishes
    final dishes = await Future.wait(dishRefs.map((ref) async {
      final doc = await ref.get();
      return Dish.fromFirestoreWithHydration(doc);
    }));

    // Fetch restaurants
    final restaurants = await Future.wait(restaurantRefs.map((ref) async {
      final doc = await ref.get();
      return Restaurant.fromFirestoreWithHydration(doc);
    }));

    return Cuisine(
      dishes: dishes,
      restaurants: restaurants,
    );
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}