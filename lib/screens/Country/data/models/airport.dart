import 'package:json_annotation/json_annotation.dart';

part 'airport.g.dart';

@JsonSerializable()
class Airport {

  Airport({
    required this.name,
    required this.code,
    required this.city
  });

  String name;
  String code;
  String city;

  // A factory constructor to create a Athlete object from JSON
  factory Airport.fromJson(Map<String, dynamic> json) => _$AirportFromJson(json);

  // A method to convert a Athlete object into JSON
  Map<String, dynamic> toJson() => _$AirportToJson(this);
}