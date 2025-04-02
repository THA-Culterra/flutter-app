import 'package:json_annotation/json_annotation.dart';

import 'meal_type.dart';

@JsonSerializable()
class Food{
  Food(
      this.name,
      this.description,
      this.mealType,
      );

  String  name ;
  String  description ;
  MealType  mealType ;
}