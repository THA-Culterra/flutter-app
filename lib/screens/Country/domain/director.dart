import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

@JsonSerializable()
class Director implements Person {
  Director(this.name, this.age);

  @override
  final String name;

  @override
  final int age;
}