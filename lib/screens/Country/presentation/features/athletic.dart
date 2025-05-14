import 'package:culterra/screens/Country/data/models/sport.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/report_suggestion.dart';
import '../../data/models/athlete.dart';
import '../../data/models/athletics.dart';
import '../../domain/entities/CTCardData.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              rowBuilder("Top Sports", athletics.popularSports),
              rowBuilder("Popular Athletes", athletics.athletes),
            ],
          ),
        ),

        ReportSuggestion()
      ],
    );
  }


  Widget rowBuilder(String title, List<CTCardData> list) {
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
              itemCount: list.length,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) => CTCard(data: list[index]),
            ),
          )
        ]);
  }
}







