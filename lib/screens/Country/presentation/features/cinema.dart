import 'package:culterra/screens/Country/data/models/movie.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/report_suggestion.dart';
import '../../data/models/cinema.dart';
import '../../data/models/tv_show.dart';

class CinemaScreen extends StatelessWidget {
  const CinemaScreen({super.key, required this.cinema});

  final Cinema cinema;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              rowBuilder("Top Movies", cinema.topMovies),

              tvShowRowBuilder("Popular TV Shows", cinema.topTvShows),
            ],
          ),
        ),

        ReportSuggestion()
      ],
    );
  }

  Widget rowBuilder(String title, List<Movie> movies) {
    return Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              )
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movies.length,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) => CTCard(data: movies[index]),
            ),
          )
        ]);
  }
  Widget tvShowRowBuilder(String title, List<TvShow> tvShows) {
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
            itemCount: tvShows.length,
            separatorBuilder: (context, _) => SizedBox(width: 16),
            itemBuilder: (context, index) => CTCard(data: tvShows[index]),
          ),
        ),
      ],
    );
  }

 }
