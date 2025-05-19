import 'package:culterra/screens/Country/data/models/movie.dart';
import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/report_suggestion.dart';
import '../../../data/models/cinema.dart';
import '../../../data/models/tv_show.dart';
import 'cinema_view_model.dart';

class CinemaScreen extends StatelessWidget {
  const CinemaScreen({super.key, required this.cinema});

  final Cinema cinema;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CinemaViewModel(cinema: cinema),
      child: Consumer<CinemaViewModel>(
        builder: (context, viewModel, _) {
          final state = viewModel.uiState;

          if (state is UiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UiError) {
            return Center(child: Text("Error: ${state.toString()}"));
          } else if (state is UiSuccess<(List<CTCardData>, List<CTCardData>)>) {
            final (movies, tvShows) = state.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      rowBuilder("Top Movies", movies),
                      rowBuilder("Popular TV Shows", tvShows),
                    ],
                  ),
                ),
                const ReportSuggestion(),
              ],
            );
          }

          return const SizedBox.shrink(); // fallback
        },
      ),
    );
  }

  Widget rowBuilder(String title, List<CTCardData> list) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: list.length,
            separatorBuilder: (context, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) => CTCard(data: list[index]),
          ),
        ),
      ],
    );
  }
}
