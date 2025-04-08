import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';

class ReportSuggestion extends StatelessWidget {
  const ReportSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            children: [
              Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    'lib/core/assets/report_flag.svg',
                    width: 18,
                    height: 18,
                  ),
                  Text(
                    "Report inaccurate information",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),

              Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    'lib/core/assets/suggestion_plus.svg',
                    width: 18,
                    height: 18,
                  ),
                  Text(
                    "Suggest an improvement",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
