import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';
import 'package:json_annotation/json_annotation.dart';

import 'tv_program.dart';

part 'movie.g.dart';
@JsonSerializable()
class Movie implements TvProgram, CTCardData {

  Movie({required this.name, required this.imageUrl});

  @override
  final String name;

  @override
  final String imageUrl;

  // A factory constructor to create a Cuisine object from JSON
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$MovieToJson(this);


}
