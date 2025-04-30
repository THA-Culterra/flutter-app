import 'package:json_annotation/json_annotation.dart';

import 'sport.dart';

import 'person.dart';

part 'athlete.g.dart';

@JsonSerializable()
class Athlete implements Person {
  Athlete({
    required this.name,
    required this.age,
    required this.sportName,
  });

  @override
  String name;

  @override
  int age;

  String sportName;

  // A factory constructor to create a Athlete object from JSON
  factory Athlete.fromJson(Map<String, dynamic> json) => _$AthleteFromJson(json);

  // A method to convert a Athlete object into JSON
  Map<String, dynamic> toJson() => _$AthleteToJson(this);
}