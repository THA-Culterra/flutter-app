import 'package:flutter/material.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/report_suggestion.dart';
import '../../data/models/music.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key, required this.music});

  final Music music;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              rowBuilder("Top Genres"),
            ],
          ),
        ),

        ReportSuggestion()
      ],
    );
  }

  Widget rowBuilder(String title) {
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
              itemCount: music.genres.length,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) => CTCard(data: music.genres[index]),
            ),
          )
        ]);
  }
}