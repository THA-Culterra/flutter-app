import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/CTCardData.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre implements CTCardData {
  Genre({
    required this.name,
    required this.imageUrl,
  });

  @override
  String  name ;

  @override
  String  imageUrl ;

  // A factory constructor to create a Cuisine object from JSON
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$GenreToJson(this);

  }