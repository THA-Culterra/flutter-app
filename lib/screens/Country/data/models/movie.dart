import 'package:json_annotation/json_annotation.dart';

import 'tv_program.dart';

@JsonSerializable()
class Movie implements TvProgram {

  Movie({required this.name, required this.image});

  @override
  final String name;

  @override
  final String image;
}
