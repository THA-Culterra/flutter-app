import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/models/transport.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key, required this.transport});

  final Transport transport;

  @override
  Widget build(BuildContext context) {
    List<List<String>> rows = [];
    for (int i = 0; i < transport.taxiApps.length; i += 2) {
      rows.add(
        transport.taxiApps.sublist(
          i,
          (i + 2 > transport.taxiApps.length)
              ? transport.taxiApps.length
              : i + 2,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Taxi apps',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 16),

          ...rows.map((row) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  // First label
                  Expanded(child: taxiLabel(lowerize(row[0]), row[0])),

                  if (row.length == 2) ...[
                    const SizedBox(width: 8), // padding between two labels
                    Expanded(child: taxiLabel(lowerize(row[1]), row[1])),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  String lowerize(String s) => s[0].toLowerCase() + s.substring(1);

  Widget taxiLabel(String icon, String name) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: [
            Image.asset('lib/core/assets/$icon.png',
                width: 60,
                height: 40,
                fit: BoxFit.cover
            ),
          Expanded(
            // prevent overflow by taking remaining space
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
              overflow:
                  TextOverflow.ellipsis, // optional: handle very long names
            ),
          ),
        ],
      ),
    );
  }
}
