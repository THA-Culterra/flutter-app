import 'package:json_annotation/json_annotation.dart';

import 'actor.dart';
import 'director.dart';
import 'movie.dart';
import 'tv_show.dart';

@JsonSerializable()
class Cinema {
  Cinema({
    required this.topMovies,
    required this.topTvShows,
    required this.famousActors,
    required this.directors,
  });

  List<Movie> topMovies;
  List<TvShow> topTvShows;
  List<Actor> famousActors;
  List<Director> directors;

  Cinema.fromJson(Map<String, dynamic> json)
      : topMovies = (json['topMovies'] as List<dynamic>)
      .map((e) => Movie.fromJson(e))
      .toList(),
        topTvShows = (json['topTvShows'] as List<dynamic>)
            .map((e) => TvShow.fromJson(e))
            .toList(),
        famousActors = (json['famousActors'] as List<dynamic>)
            .map((e) => Actor.fromJson(e))
            .toList(),
        directors = (json['directors'] as List<dynamic>)
            .map((e) => Director.fromJson(e))
            .toList();
}