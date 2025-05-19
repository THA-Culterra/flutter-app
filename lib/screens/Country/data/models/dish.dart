import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Data/review.dart';
import '../../domain/entities/CTCardData.dart';
import 'meal_type.dart';

class Dish implements CTCardData {
  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.mealType,
    required this.imageUrl,
    required this.reviewRefs,
    this.hydratedReviews,
  });

  final String id;
  @override
  final String name;
  final String description;
  final MealType mealType;
  @override
  final String imageUrl;

  // Firestore refs
  final List<DocumentReference> reviewRefs;

  // Hydrated objects
  final List<Review>? hydratedReviews;

  /// Used during Firestore loading
  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'],
      name: map['name'] as String,
      description: map['description'] as String,
      mealType: MealType.values.firstWhere(
            (e) => e.toString().split('.').last == map['mealType'],
        orElse: () => MealType.breakfast,
      ),
      imageUrl: map['imageUrl'] as String,
      reviewRefs: (map['reviews'] as List<dynamic>? ?? [])
          .whereType<DocumentReference>()
          .toList(),
    );
  }

  /// To Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'mealType': mealType.toString().split('.').last,
      'imageUrl': imageUrl,
      'reviews': reviewRefs,
    };
  }

  Map<String, dynamic> toFirestore() => toMap();

  /// Factory from Firestore
  factory Dish.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Dish.fromMap({...data, 'id': doc.id});
  }

  /// hydrated reviews
  Dish copyWith({
    List<Review>? hydratedReviews,
  }) {
    return Dish(
      id: id,
      name: name,
      description: description,
      mealType: mealType,
      imageUrl: imageUrl,
      reviewRefs: reviewRefs,
      hydratedReviews: hydratedReviews ?? this.hydratedReviews,
    );
  }
}