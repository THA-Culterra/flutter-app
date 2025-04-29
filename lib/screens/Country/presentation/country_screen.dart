import 'package:culterra/screens/Country/presentation/country_sheet.dart';
import 'package:flutter/material.dart';

import '../data/models/country.dart';
import 'country_view_model.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({super.key, required this.country});

  final Country country;

  final CountryViewModel countryViewModel = CountryViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              "lib/core/assets/country_placeholder.jpg",
              width: double.infinity,
              height: 700,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7), // Dark at bottom
                      Colors.transparent, // Fully transparent at top
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
        Positioned(
          child: CountrySheet(country: country),
        )
      ],
    );
  }
}
