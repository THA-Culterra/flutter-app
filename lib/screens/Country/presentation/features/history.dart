import 'package:flutter/material.dart';

import '../../data/models/history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.history});

  final History history;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("National Day"),
        Text(history.nationalDay.toString())
      ],
    );
  }

  Widget holidaysBuilder(History history) {
    final nationalDayEntry = history.nationalDay.entries.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "National Day",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          nationalDayEntry.key, // Name of the National Day (e.g., Independence Day)
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 4),
        Text(
          "${nationalDayEntry.value.day}/${nationalDayEntry.value.month}/${nationalDayEntry.value.year}",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
