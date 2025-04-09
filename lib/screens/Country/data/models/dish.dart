import 'package:json_annotation/json_annotation.dart';

import 'meal_type.dart';

@JsonSerializable()
class Dish {
  Dish({
    required this.name,
    required this.description,
    required this.mealType,
  });

  String  name ;
  String  description ;
  MealType  mealType ;
}