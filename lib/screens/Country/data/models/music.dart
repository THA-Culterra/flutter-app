import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/data/models/singer.dart';
import 'package:culterra/screens/Country/data/models/song.dart';

import 'genre.dart';

class Music {
  Music({
    required this.genres,
    required this.topSongs,
    required this.notableSingers,
  });

  final List<Genre> genres;
  final List<Song> topSongs;
  final List<Singer> notableSingers;

  static Future<Music> fromMapWithHydration(Map<String, dynamic> map) async {
    final genresRaw = (map['genres'] as List<dynamic>? ?? []);
    final genres = <Genre>[];

    for (final genreMap in genresRaw.whereType<Map<String, dynamic>>()) {
      final genre = await Genre.fromMapWithHydration(genreMap);
      genres.add(genre);
    }

    final topSongRefs = (map['topSongs'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();
    final topSongs = await Future.wait(topSongRefs.map((ref) async {
      final doc = await ref.get();
      return Song.fromFirestore(doc);
    }));

    final singerRefs = (map['notableSingers'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();
    final singers = await Future.wait(singerRefs.map((ref) async {
      final doc = await ref.get();
      return Singer.fromFirestore(doc);
    }));

    return Music(
      genres: genres,
      topSongs: topSongs,
      notableSingers: singers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genres': genres.map((g) => g.toMap()).toList(),
      'topSongs': topSongs.map((s) => FirebaseFirestore.instance.doc('songs/${s.id}')).toList(),
      'notableSingers': notableSingers.map((s) => FirebaseFirestore.instance.doc('singers/${s.id}')).toList(),
    };
  }
}