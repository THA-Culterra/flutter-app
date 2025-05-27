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

    final genresRef = (map['genres'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final genres = await Future.wait(genresRef.map((ref) async {
      final doc = await ref.get();
      return Genre.fromFirestoreWithHydration(doc);
    }));

    // Hydrate topSongs
    final songRefs = (map['topSongs'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final topSongs = await Future.wait(songRefs.map((ref) async {
      final doc = await ref.get();
      return Song.fromFirestoreWithHydration(doc);
    }));

    // Hydrate notableSingers
    final singerRefs = (map['notableSingers'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final notableSingers = await Future.wait(singerRefs.map((ref) async {
      final doc = await ref.get();
      return Singer.fromFirestore(doc);
    }));

    return Music(
      genres: genres,
      topSongs: topSongs,
      notableSingers: notableSingers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genres': genres.map((g) => FirebaseFirestore.instance.doc('genres/${g.id}')).toList(),
      'topSongs': topSongs.map((s) => FirebaseFirestore.instance.doc('songs/${s.id}')).toList(),
      'notableSingers': notableSingers.map((s) => FirebaseFirestore.instance.doc('persons/${s.id}')).toList(),
    };
  }
}