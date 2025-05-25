import '../../../Data/review.dart';
import 'actor.dart';

abstract class TvProgram {
  String get name;
  String get imageUrl;

  String get id;


  List<Actor> get topActors;
  List<Review> get reviews;
}