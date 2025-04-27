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
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nationalDayBuilder(history.nationalDay.entries.first),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Public Holidays',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                    ),
                  ),
                  ...datesBuilder(history.publicHolidays),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Key Events',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                    ),
                  ),
                  ...datesBuilder(history.keyEvents),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget nationalDayBuilder(MapEntry<String, DateTime> nationalDayEntry) {
    return Column(
      children: [
        Column(
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
        ),
      ],
    );
  }

  List<Widget> datesBuilder(Map<String, DateTime> dates) {
    return dates.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(entry.key, style: const TextStyle(fontSize: 16, decoration: TextDecoration.none, color: Colors.black,))),
            Text(
              '${entry.value.day}/${entry.value.month}/${entry.value.year}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  decoration: TextDecoration.none
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
