import 'package:json_annotation/json_annotation.dart';

import 'meal_type.dart';

@JsonSerializable()
class Dish {
  Dish({
    required this.name,
    required this.description,
    required this.mealType,
    required this.imageUrl,
  });

  String name;
  String description;
  MealType mealType;
  String imageUrl;

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      name: json['name'],
      description: json['description'],
      mealType: MealType.values.firstWhere(
            (e) => e.toString().split('.').last == json['mealType'],
        orElse: () => MealType.dinner, // or a default you prefer
      ),
      imageUrl: json['imageUrl'],
    );
  }
}