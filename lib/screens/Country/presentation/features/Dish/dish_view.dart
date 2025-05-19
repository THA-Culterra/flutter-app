import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:culterra/screens/Widgets/review_card.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../data/models/dish.dart';
import 'dish_view_model.dart';

class DishView extends StatelessWidget {
  DishView({super.key, required this.dishId});

  final String dishId;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DishViewModel(dishId),
      child: Consumer<DishViewModel>(
        builder: (context, viewModel, _) {
          final state = viewModel.state;

          if (state is UiLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UiError) {
            return Center(child: Text('Error: ${state.toString()}'));
          }

          final dish = (state as UiSuccess<Dish>).data;

          return Material(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dish image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        dish.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dish.name,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dish.mealType.name,
                            style: const TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            dish.description,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 16),
                          const Text("Expert reviews", style: TextStyle(fontSize: 16)),

                          if (dish.hydratedReviews != null)
                            ReviewCard(
                              reviews: dish.hydratedReviews!,
                              controller: commentController,
                              onPost: () {
                                viewModel.addReview(commentController.text);
                                commentController.clear();
                              },
                            ),
                        ],
                      ),
                    ),
                    ReportSuggestion(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
