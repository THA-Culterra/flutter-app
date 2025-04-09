import 'package:json_annotation/json_annotation.dart';

import 'actor.dart';
import 'director.dart';
import 'movie.dart';
import 'tv_show.dart';

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
}