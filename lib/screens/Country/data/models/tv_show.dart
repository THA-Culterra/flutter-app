import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';
import 'package:json_annotation/json_annotation.dart';

import 'tv_program.dart';

part 'tv_show.g.dart';
@JsonSerializable()
class TvShow implements TvProgram, CTCardData {

  TvShow({
    required this.name,
    required this.imageUrl
  });

  @override
  final String name;

  @override
  final String imageUrl;

  // A factory constructor to create a Cuisine object from JSON
  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$TvShowToJson(this);
}
