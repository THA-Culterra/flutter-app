import 'package:culterra/screens/Country/presentation/country_sheet.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Image.asset(
            "lib/core/assets/country_placeholder.jpg",
            width: 440,
            height: 500,
            fit: BoxFit.cover,
          ),
        Positioned(
          child: CountrySheet(),
        ),
      ],
    );
  }
}
