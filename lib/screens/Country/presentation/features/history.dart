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
          nationalDayBuilder(history.nationalDay),

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

  Widget nationalDayBuilder(NamedDate nationalDayEntry) {
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
              nationalDayEntry.name, // Name of the National Day (e.g., Independence Day)
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none
              ),
            ),
            SizedBox(height: 4),
            Text(
              "${nationalDayEntry.date.day}/${nationalDayEntry.date.month}/${nationalDayEntry.date.year}",
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

  List<Widget> datesBuilder(List<NamedDate> dates) {
    return dates.map((namedDate) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                namedDate.name,
                style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              '${namedDate.date.day}/${namedDate.date.month}/${namedDate.date.year}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
