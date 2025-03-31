import 'package:culterra/screens/Country/presentation/country_sheet.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        CountrySheet()
      ],
    );
  }
}
