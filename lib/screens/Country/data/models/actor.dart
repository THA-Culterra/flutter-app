import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

@JsonSerializable()
class Actor implements Person {
  Actor({required this.name, required this.age});

  @override
  final String name;

  @override
  final int age;

  Actor.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
}
