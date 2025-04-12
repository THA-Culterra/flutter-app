import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

@JsonSerializable()
class Director implements Person {
  Director({required this.name, required this.age});

  @override
  final String name;

  @override
  final int age;

  Director.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
}