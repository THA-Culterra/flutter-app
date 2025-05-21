import 'package:flutter/material.dart';
import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/report_suggestion.dart';
import '../../../data/models/athletics.dart';
import '../../../domain/entities/CTCardData.dart';

class AthleticScreen extends StatelessWidget {
  const AthleticScreen({super.key, required this.athletics});

  final Athletics athletics;

  @override
  Widget build(BuildContext context) {
    final List<CTCardData> sports = athletics.popularSports;
    final List<CTCardData> athletes = athletics.athletes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowBuilder("Top Sports", sports),
              const SizedBox(height: 16),
              rowBuilder("Popular Athletes", athletes),
            ],
          ),
        ),
        const ReportSuggestion(),
      ],
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
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) => CTCard(data: list[index]),
          ),
        ),
      ],
    );
  }
}