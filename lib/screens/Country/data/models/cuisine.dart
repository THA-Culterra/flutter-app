import 'package:json_annotation/json_annotation.dart';
import 'dish.dart';
import 'restaurant.dart';

@JsonSerializable()
class Cuisine {
  Cuisine({
    required this.dishes,
    required this.restaurants,
  });

  List<Dish> dishes;
  List<Restaurant> restaurants;

  factory Cuisine.fromJson(Map<String, dynamic> json) {
    return Cuisine(
      dishes: (json['dishes'] as List)
          .map((item) => Dish.fromJson(item))
          .toList(),
      restaurants: (json['restaurants'] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList(),
    );
  }
}