import 'package:json_annotation/json_annotation.dart';

import 'person.dart';
import 'song.dart';

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
}