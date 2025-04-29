import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

part 'actor.g.dart';

@JsonSerializable()
class Actor implements Person {
  Actor({required this.name, required this.age});

  @override
  final String name;

  @override
  final int age;

  // A factory constructor to create a Cuisine object from JSON
  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
