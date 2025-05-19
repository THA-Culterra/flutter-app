import 'package:flutter/Material.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../data/models/cinema.dart';
import '../../../data/models/movie.dart';
import '../../../data/models/tv_show.dart';
import '../../../domain/entities/CTCardData.dart';

class CinemaViewModel extends ChangeNotifier {
  final Cinema cinema;

  UiState<(List<CTCardData>, List<CTCardData>)> uiState = UiLoading();

  CinemaViewModel({required this.cinema}) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final movieDocs = await Future.wait(
        cinema.topMovies.map((ref) => ref.get()),
      );

      final tvShowDocs = await Future.wait(
        cinema.topTvShows.map((ref) => ref.get()),
      );

      final movies = movieDocs.map((doc) => Movie.fromFirestore(doc)).toList();
      final tvShows = tvShowDocs.map((doc) => TvShow.fromFirestore(doc)).toList();

      uiState = UiSuccess((movies, tvShows));
    } catch (e) {
      uiState = UiError(e.toString());
    }

    notifyListeners();
  }
}