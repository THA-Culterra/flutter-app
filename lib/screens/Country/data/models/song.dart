import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Song {
  Song({
    required this.name,
    required this.views
  });

  String name;

  int views;

}