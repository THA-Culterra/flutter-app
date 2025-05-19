import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';

import '../../../../Data/review.dart';
import '../../../../Profile/domain/entities/uiState.dart';
import '../../../data/models/dish.dart';

class DishViewModel extends ChangeNotifier {
  final String dishId;
  UiState<Dish> state = UiLoading();

  DishViewModel(this.dishId) {
    fetchDish();
  }

  Future<void> fetchDish() async {
    try {
      // Step 1: Fetch Dish Document
      final doc = await FirebaseFirestore.instance.collection('dishes').doc(dishId).get();

      // Step 2: Deserialize basic Dish object (with reference list)
      Dish dish = Dish.fromFirestore(doc);

      // Step 3: Fetch actual review documents using the DocumentReferences
      final reviewDocs = await Future.wait(
        dish.reviewRefs.map((ref) => ref.get()),
      );

      final hydratedReviews = reviewDocs
          .map((doc) => Review.fromFirestore(doc))
          .toList();

      // Step 4: Replace the references with hydrated data
      dish = dish.copyWith(hydratedReviews: hydratedReviews);

      state = UiSuccess(dish);
    } catch (e) {
      state = UiError("Failed to load dish: $e");
    }

    notifyListeners();
  }

  Future<void> addReview(String text) async {
    try {
      final currentUserId = FirebaseAuth.instance.currentUser!.uid;

      final reviewCollection = FirebaseFirestore.instance
          .collection('dishes')
          .doc(dishId)
          .collection('reviews');

      // Create a new doc reference to auto-generate ID
      final newDocRef = reviewCollection.doc();

      final review = Review(
        id: newDocRef.id,
        authorId: currentUserId,
        text: text,
      );

      await newDocRef.set(review.toMap());

      await fetchDish(); // Refresh after posting
    } catch (e) {
      print("Error posting review: $e");
    }
  }
}