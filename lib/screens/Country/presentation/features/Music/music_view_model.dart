import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../data/models/music.dart';

class MusicViewModel extends ChangeNotifier {
  final Music rawMusic;

  UiState<Music> state = UiLoading();

  MusicViewModel(this.rawMusic) {
    hydrate();
  }

  Future<void> hydrate() async {
    try {
      final hydratedMusic = await rawMusic.hydrate();
      state = UiSuccess(hydratedMusic);
    } catch (e) {
      state = UiError('Failed to hydrate music: $e');
    }
    notifyListeners();
  }
}