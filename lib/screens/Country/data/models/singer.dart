import 'package:json_annotation/json_annotation.dart';

import 'person.dart';
import 'song.dart';

part 'singer.g.dart';
@JsonSerializable()
class Singer implements Person {
  Singer({
    required this.name,
    required this.age,
    required this.songs
  });

  @override
  final String name;

  @override
  final int age;

  List<Song> songs;

  // A factory constructor to create a Cuisine object from JSON
  factory Singer.fromJson(Map<String, dynamic> json) => _$SingerFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$SingerToJson(this);
}