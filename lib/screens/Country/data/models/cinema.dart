import 'package:json_annotation/json_annotation.dart';

import 'actor.dart';
import 'director.dart';
import 'movie.dart';
import 'tv_show.dart';

part 'cinema.g.dart';

@JsonSerializable()
class Cinema{
  Cinema({
    required this.topMovies,
    required this.topTvShows,
    required this.famousActors,
    required this.directors,
  });

  List<Movie>  topMovies ;
  List<TvShow>  topTvShows ;
  List<Actor>  famousActors ;
  List<Director>  directors ;

  // A factory constructor to create a Cuisine object from JSON
  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$CinemaToJson(this);
}