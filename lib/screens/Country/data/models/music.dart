import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'song.dart';
import 'singer.dart';

part 'music.g.dart';
@JsonSerializable()
class Music {
  Music({
    required this.genres,
    required this.topSongs,
    required this.notableSingers
  });

  List<Genre> genres;

  List<Song> topSongs;

  List<Singer> notableSingers;

  // A factory constructor to create a Cuisine object from JSON
  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$MusicToJson(this);
}