import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/CTCardData.dart';
import 'meal_type.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish implements CTCardData {
  Dish({
  required this.name,
  required this.description,
  required this.mealType,
  required this.imageUrl
  });

  @override
  String  name ;
  String  description ;
  MealType  mealType ;
  @override
  String imageUrl;

  // A factory constructor to create a Cuisine object from JSON
  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$DishToJson(this);
}