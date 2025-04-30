import 'package:json_annotation/json_annotation.dart';
import 'dish.dart';
import 'restaurant.dart';

part 'cuisine.g.dart';

@JsonSerializable()
class Cuisine {
  Cuisine({
    required this.dishes,
    required this.restaurants,
  });

  final List<Dish> dishes;
  final List<Restaurant> restaurants;

  // A factory constructor to create a Cuisine object from JSON
  factory Cuisine.fromJson(Map<String, dynamic> json) => _$CuisineFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$CuisineToJson(this);
}