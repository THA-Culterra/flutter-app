import 'athlete.dart';
import 'sport.dart';

class Athletics {
  Athletics({
    required this.popularSports,
    required this.athletes,
  });

  List<Sport> popularSports;
  List<Athlete> athletes;
}