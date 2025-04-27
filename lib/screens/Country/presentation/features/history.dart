import 'package:flutter/material.dart';

import '../../data/models/history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.history});

  final History history;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          holidaysBuilder(history.nationalDay.entries.first)
        ],
      ),
    );
  }

  Widget holidaysBuilder(MapEntry<String, DateTime> nationalDayEntry) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "National Day",
          style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
          ),
        ),
        SizedBox(height: 8),
        Text(
          nationalDayEntry.key, // Name of the National Day (e.g., Independence Day)
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none
          ),
        ),
        SizedBox(height: 4),
        Text(
          "${nationalDayEntry.value.day}/${nationalDayEntry.value.month}/${nationalDayEntry.value.year}",
          style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none
          ),
        ),
      ],
    );
  }
}
