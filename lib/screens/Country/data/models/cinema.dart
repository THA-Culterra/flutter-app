import 'package:cloud_firestore/cloud_firestore.dart';

import 'tv_show.dart';
import 'movie.dart';
import 'director.dart';
import 'actor.dart';

class Cinema {
  final List<Movie> topMovies;     // movies are a subset of tv_programs
  final List<TvShow> topTvShows;    // tv shows are a subset of tv_programs
  final List<Actor> famousActors;     // actors in persons collection
  final List<Director> directors;        // directors in persons collection

  Cinema({
    required this.topMovies,
    required this.topTvShows,
    required this.famousActors,
    required this.directors,
  });

  factory Cinema.fromMap(Map<String, dynamic> map) {
    return Cinema(
      topMovies: [],
      topTvShows: [],
      famousActors: [],
      directors: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'topMovies': topMovies.map((m) => FirebaseFirestore.instance.doc('tv_programs/${m.id}')).toList(),
      'topTvShows': topTvShows.map((t) => FirebaseFirestore.instance.doc('tv_programs/${t.id}')).toList(),
      'famousActors': famousActors.map((a) => FirebaseFirestore.instance.doc('persons/${a.id}')).toList(),
      'directors': directors.map((d) => FirebaseFirestore.instance.doc('persons/${d.id}')).toList(),
    };
  }

  factory Cinema.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Cinema.fromMap(data);
  }

  static Future<Cinema> fromMapWithHydration(Map<String, dynamic> map) async {
    final movieRefs = (map['topMovies'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    final tvShowRefs = (map['topTvShows'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    final actorRefs = (map['famousActors'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    final directorRefs = (map['directors'] as List<dynamic>?)
        ?.whereType<DocumentReference>()
        .toList() ?? [];

    final topMovies = await Future.wait(movieRefs.map((ref) async {
      final doc = await ref.get();
      return Movie.fromMapWithHydration(doc);
    }));

    final topTvShows = await Future.wait(tvShowRefs.map((ref) async {
      final doc = await ref.get();
      return TvShow.fromMapWithHydration(doc);
    }));

    final famousActors = await Future.wait(actorRefs.map((ref) async {
      final doc = await ref.get();
      return Actor.fromFirestore(doc);
    }));

    final directors = await Future.wait(directorRefs.map((ref) async {
      final doc = await ref.get();
      return Director.fromFirestore(doc);
    }));

    return Cinema(
      topMovies: topMovies,
      topTvShows: topTvShows,
      famousActors: famousActors,
      directors: directors,
    );
  }

  Map<String, dynamic> toFirestore() => toMap();
}