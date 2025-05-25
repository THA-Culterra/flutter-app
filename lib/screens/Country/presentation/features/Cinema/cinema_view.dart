import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';
import 'package:flutter/material.dart';

import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/report_suggestion.dart';
import '../../../data/models/cinema.dart';
import '../../../data/models/tv_program.dart';
import '../TvProgram/tv_program_view.dart';

class CinemaScreen extends StatelessWidget {
  const CinemaScreen({super.key, required this.cinema});

  final Cinema cinema;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowBuilder("Top Movies", cinema.topMovies),
          const SizedBox(height: 24),
          rowBuilder("Popular TV Shows", cinema.topTvShows),
          const SizedBox(height: 24),
          const ReportSuggestion(),
        ],
      ),
    );
  }

  Widget rowBuilder(String title, List<CTCardData> list) {
    return Column(
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
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: list.length,
            separatorBuilder: (context, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final data = list[index];

                return GestureDetector(
                  onTap: () {
                    if (data is TvProgram) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TvProgramView(tvProgram: data as TvProgram),
                        ),
                      );
                    }
                  },
                  child: CTCard(data: data),
                );
              }
          ),
        ),
      ],
    );
  }
}
