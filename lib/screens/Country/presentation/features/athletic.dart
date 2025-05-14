import 'package:culterra/screens/Country/data/models/sport.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/report_suggestion.dart';
import '../../data/models/athlete.dart';
import '../../data/models/athletics.dart';

class AthleticScreen extends StatelessWidget {
  const AthleticScreen({super.key, required this.athletics});

  final Athletics athletics;

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
              rowBuilder("Top Sports", athletics.popularSports),
              const SizedBox(height: 24),
              athleteRowBuilder("Popular Athletes", athletics.athletes),
            ],
          ),
        ),

        ReportSuggestion()
      ],
    );
  }


  Widget rowBuilder(String title, List<Sport> popularSports) {
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
              itemCount: popularSports.length,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) => CTCard(data: popularSports[index]),
            ),
          )
        ]);
  }

  Widget athleteRowBuilder(String title, List<Athlete> athletes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
          ],
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: athletes.length,
              separatorBuilder: (context, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) => CTCard(data: athletes[index]),
            ),
          ),
        ),
      ],
    );
  }

}







