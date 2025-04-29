import 'package:json_annotation/json_annotation.dart';

part 'trophy.g.dart';

@JsonSerializable()
class Trophy {
  Trophy({
    required this.name,
    required this.count,
  });

  String name;
  int count;

  // A factory constructor to create a Cuisine object from JSON
  factory Trophy.fromJson(Map<String, dynamic> json) => _$TrophyFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$TrophyToJson(this);
}