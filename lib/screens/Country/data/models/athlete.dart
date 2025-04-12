import 'sport.dart';

import 'person.dart';

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

  Athlete.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        sportName = json['sportName'];
}