import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'song.dart';
import 'singer.dart';

@JsonSerializable()
class Music {
  Music({
    required this.genres,
    required this.topSongs,
    required this.notableSingers,
  });

  List<Genre> genres;
  List<Song> topSongs;
  List<Singer> notableSingers;

  Music.fromJson(Map<String, dynamic> json)
      : genres = (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
        topSongs = (json['topSongs'] as List<dynamic>)
            .map((e) => Song.fromJson(e as Map<String, dynamic>))
            .toList(),
        notableSingers = (json['notableSingers'] as List<dynamic>)
            .map((e) => Singer.fromJson(e as Map<String, dynamic>))
            .toList();
}