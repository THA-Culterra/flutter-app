import 'package:json_annotation/json_annotation.dart';

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

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      city: json['city'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}