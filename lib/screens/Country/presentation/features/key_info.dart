import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/country.dart';

class KeyInfoScreen extends StatelessWidget {
  const KeyInfoScreen({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                description(country.description),

                capitalItem(country.capital),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                      country.majorCities.length,
                          (index) => city(country.majorCities[index])
                  ),
                ),

                labelResponse("Official Language(s)", country.languages),

                labelResponse("Currency", country.currency),

                labelResponse("Major Religions", country.religion.name),

                labelResponse("Dial Code", country.dialCode)
              ],
            ),
        ),

        ReportSuggestion()
      ],
    );
  }

  Column labelResponse(String label, dynamic response) {
    // Check if the response is a List or a String, and convert to a list if necessary
    List<String> responseList = response is List<String> ? response : [response];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[700],
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
        Text(
          responseList.join(", "), // Join the list into a single string
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }

  Container city(String name) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
            ),
          );
  }

  Column capitalItem(String capital) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Capital City",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 7, // 70% of the Row
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                      ),
                      alignment: Alignment.centerLeft, // Center vertically, align left
                      padding: EdgeInsets.only(left: 16), // Add left padding
                      child: Text(
                        capital,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.purple,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3, // 30% of the Row
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
                      ),
                      height: 70,
                      child: Center(
                        child: SvgPicture.asset(
                          "lib/core/assets/pin.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  Column description(description) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),

        Divider(),
      ],
    );
  }
}
