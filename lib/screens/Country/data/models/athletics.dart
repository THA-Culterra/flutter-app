import 'athlete.dart';
import 'sport.dart';

class Athletics {
  Athletics({
    required this.popularSports,
    required this.athletes,
  });

  List<Sport> popularSports;
  List<Athlete> athletes;

  Athletics.fromJson(Map<String, dynamic> json)
      : popularSports = (json['popularSports'] as List)
      .map((item) => Sport.fromJson(item))
      .toList(),
        athletes = (json['athletes'] as List)
            .map((item) => Athlete.fromJson(item))
            .toList();
}