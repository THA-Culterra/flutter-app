import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Restaurant {
  Restaurant ({
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  String name;
  String city;
  double latitude;
  double longitude;
}