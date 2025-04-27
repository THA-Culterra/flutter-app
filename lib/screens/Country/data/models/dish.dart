import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/CTCardData.dart';
import 'meal_type.dart';

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
}