import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  Restaurant({
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  String name;
  String city;
  double latitude;
  double longitude;

  // Factory constructor to create a Restaurant object from JSON
  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  // Method to convert a Restaurant object to JSON
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}