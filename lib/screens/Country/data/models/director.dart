import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

part 'director.g.dart';

@JsonSerializable()
class Director implements Person {
  Director({required this.name, required this.age});

  @override
  final String name;

  @override
  final int age;

  // A factory constructor to create a Cuisine object from JSON
  factory Director.fromJson(Map<String, dynamic> json) => _$DirectorFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$DirectorToJson(this);
}