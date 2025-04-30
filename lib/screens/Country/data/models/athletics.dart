import 'package:json_annotation/json_annotation.dart';

import 'athlete.dart';
import 'sport.dart';

part 'athletics.g.dart';

@JsonSerializable()
class Athletics {
  Athletics({
    required this.popularSports,
    required this.athletes,
  });

  List<Sport> popularSports;
  List<Athlete> athletes;

  // A factory constructor to create a Cuisine object from JSON
  factory Athletics.fromJson(Map<String, dynamic> json) => _$AthleticsFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$AthleticsToJson(this);
}