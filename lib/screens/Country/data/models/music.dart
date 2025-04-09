import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'song.dart';
import 'singer.dart';

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
}