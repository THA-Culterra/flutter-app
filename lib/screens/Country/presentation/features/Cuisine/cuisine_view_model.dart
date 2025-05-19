import 'package:flutter/Material.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../data/models/cuisine.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';

class CuisineViewModel extends ChangeNotifier {
  final Cuisine cuisine;

  UiState<(List<Dish>, List<Restaurant>)> uiState = UiLoading();

  CuisineViewModel({required this.cuisine}) {
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final dishDocs = await Future.wait(cuisine.dishes.map((ref) => ref.get()));
      final restaurantDocs = await Future.wait(cuisine.restaurants.map((ref) => ref.get()));

      final dishes = dishDocs.map((doc) => Dish.fromFirestore(doc)).toList();
      final restaurants = restaurantDocs.map((doc) => Restaurant.fromFirestore(doc)).toList();

      uiState = UiSuccess((dishes, restaurants));
    } catch (e) {
      uiState = UiError(e.toString());
    }

    notifyListeners();
  }
}