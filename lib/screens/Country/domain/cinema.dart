import 'package:json_annotation/json_annotation.dart';

import 'actor.dart';
import 'director.dart';
import 'movie.dart';
import 'tv_show.dart';

@JsonSerializable()
class Cinema{
  Cinema(
      this.topMovies,
      this.topTvShows,
      this.famousActors,
      this.directors,
      );

  List<Movie>  topMovies ;
  List<TvShow>  topTvShows ;
  List<Actor>  famousActors ;
  List<Director>  directors ;
}