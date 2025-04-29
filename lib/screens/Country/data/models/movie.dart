import 'package:json_annotation/json_annotation.dart';

import 'tv_program.dart';

part 'movie.g.dart';
@JsonSerializable()
class Movie implements TvProgram {

  Movie({required this.name, required this.image});

  @override
  final String name;

  @override
  final String image;

  // A factory constructor to create a Cuisine object from JSON
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
