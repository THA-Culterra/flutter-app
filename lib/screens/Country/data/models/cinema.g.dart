// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cinema _$CinemaFromJson(Map<String, dynamic> json) => Cinema(
  topMovies:
      (json['topMovies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
  topTvShows:
      (json['topTvShows'] as List<dynamic>)
          .map((e) => TvShow.fromJson(e as Map<String, dynamic>))
          .toList(),
  famousActors:
      (json['famousActors'] as List<dynamic>)
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
  directors:
      (json['directors'] as List<dynamic>)
          .map((e) => Director.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CinemaToJson(Cinema instance) => <String, dynamic>{
  'topMovies': instance.topMovies,
  'topTvShows': instance.topTvShows,
  'famousActors': instance.famousActors,
  'directors': instance.directors,
};
