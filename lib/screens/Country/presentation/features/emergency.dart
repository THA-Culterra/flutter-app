import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/emergency.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key, required this.emergency});

  final Emergency emergency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                "Emergency Services",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              emergencyRow("police", "Police", emergency.police),
              emergencyRow("ambulance", "Ambulance", emergency.ambulance),
              emergencyRow("fire", "Fire", emergency.fire)
            ]
          ),

        ),

        ReportSuggestion()
      ],
    );
  }

  Widget emergencyRow(String icon, String name, int number) {
    return GestureDetector(
      onTap: () async {
        final Uri callUri = Uri(scheme: 'tel', path: number.toString());
        if (await canLaunchUrl(callUri)) {
          await launchUrl(callUri);
        } else {
          throw 'Could not launch $callUri';
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'lib/core/assets/$icon.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              number.toString(),
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
