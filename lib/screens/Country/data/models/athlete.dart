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
}