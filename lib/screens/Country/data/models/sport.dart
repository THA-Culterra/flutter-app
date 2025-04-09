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
  String teamLogo; // URL or asset path
}
