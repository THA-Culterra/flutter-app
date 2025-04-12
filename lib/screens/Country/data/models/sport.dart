import 'trophy.dart';
import 'package:json_annotation/json_annotation.dart';

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
  String teamLogo;

  Sport.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        nationalTeamYear = json['nationalTeamYear'],
        trophies = (json['trophies'] as List)
            .map((item) => Trophy.fromJson(item))
            .toList(),
        teamLogo = json['teamLogo'];
}
