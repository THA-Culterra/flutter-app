import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';
@JsonSerializable()
class Song {
  Song({
    required this.name,
    required this.views
  });

  String name;

  int views;

  // A factory constructor to create a Cuisine object from JSON
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$SongToJson(this);
}