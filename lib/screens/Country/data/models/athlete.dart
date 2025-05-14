import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';
import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

part 'athlete.g.dart';

@JsonSerializable()
class Athlete implements Person, CTCardData {
  Athlete({
    required this.name,
    required this.age,
    required this.sportName,
    required this.imageUrl,
  });

  @override
  String name;

  @override
  int age;

  String sportName;

  @override
  String imageUrl;

  // A factory constructor to create a Athlete object from JSON
  factory Athlete.fromJson(Map<String, dynamic> json) => _$AthleteFromJson(json);

  // A method to convert a Athlete object into JSON
  Map<String, dynamic> toJson() => _$AthleteToJson(this);
}