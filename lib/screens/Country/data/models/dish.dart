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
    this.reviews,
  });

  final String id;
  @override
  final String name;
  final String description;
  final MealType mealType;
  @override
  final String imageUrl;

  // Hydrated reviews from subcollection
  final List<Review>? reviews;

  /// Basic constructor from Firestore map (no hydration)
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
    );
  }

  /// Firestore serialization (without subcollections)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'mealType': mealType.toString().split('.').last,
      'imageUrl': imageUrl,
    };
  }

  Map<String, dynamic> toFirestore() => toMap();

  /// Construct from Firestore snapshot (no hydration)
  factory Dish.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Dish.fromMap({...data, 'id': doc.id});
  }

  /// Hydration: loads reviews from subcollection `dishes/{dishId}/reviews`
  static Future<Dish> fromFirestoreWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final id = doc.id;

    final reviewSnapshots = await doc.reference.collection('reviews').get();
    final hydratedReviews = await Future.wait(
      reviewSnapshots.docs.map(Review.fromFirestoreWithHydration),
    );

    return Dish(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      mealType: MealType.values.firstWhere(
            (e) => e.toString().split('.').last == data['mealType'],
        orElse: () => MealType.breakfast,
      ),
      imageUrl: data['imageUrl'] ?? '',
      reviews: hydratedReviews,
    );
  }

  /// Copy with updated reviews
  Dish copyWith({List<Review>? reviews}) {
    return Dish(
      id: id,
      name: name,
      description: description,
      mealType: mealType,
      imageUrl: imageUrl,
      reviews: reviews ?? this.reviews,
    );
  }
}