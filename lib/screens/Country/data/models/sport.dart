import 'trophy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sport.g.dart';
@JsonSerializable()
class Sport {
  Sport({
    required this.name,
    required this.nationalTeamYear,
    required this.trophies,
    required this.teamLogo,
  });

  String name;
  int nationalTeamYear;
  List<Trophy> trophies;
  String teamLogo; // URL or asset path

// A factory constructor to create a Cuisine object from JSON
  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$SportToJson(this);
}
