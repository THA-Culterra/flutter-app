import 'package:json_annotation/json_annotation.dart';

import 'tv_program.dart';

@JsonSerializable()
class TvShow implements TvProgram {

  TvShow({
    required this.name,
    required this.image
  });

  @override
  final String name;

  @override
  final String image;
}
