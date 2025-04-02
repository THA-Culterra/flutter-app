import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Song {
  Song(
      this.name,
      this.views);

  String name;

  int views;

}