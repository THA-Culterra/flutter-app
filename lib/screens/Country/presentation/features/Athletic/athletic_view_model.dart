import 'package:flutter/Material.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../data/models/athlete.dart';
import '../../../data/models/athletics.dart';
import '../../../data/models/sport.dart';
import '../../../domain/entities/CTCardData.dart';

class AthleticsViewModel extends ChangeNotifier {
  final Athletics athletics;

  UiState<(List<CTCardData>, List<CTCardData>)> uiState = UiLoading();

  AthleticsViewModel({required this.athletics}) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final sportDocs = await Future.wait(
        athletics.popularSports.map((ref) => ref.get()),
      );

      final athleteDocs = await Future.wait(
        athletics.athletes.map((ref) => ref.get()),
      );

      final sports = sportDocs.map((doc) => Sport.fromFirestore(doc)).toList();
      final athletes = athleteDocs.map((doc) => Athlete.fromFirestore(doc)).toList();

      uiState = UiSuccess((sports, athletes));
    } catch (e) {
      uiState = UiError(e.toString());
    }

    notifyListeners();
  }
}