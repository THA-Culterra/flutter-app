import 'package:json_annotation/json_annotation.dart';
import 'dish.dart';
import 'restaurant.dart';

@JsonSerializable()
class Cuisine {
  Cuisine ({
    required this.dishes,
    required this.restaurants,
  });

  List<Dish> dishes ;
  List<Restaurant>  restaurants ;
}