import 'package:culterra/screens/Country/presentation/country_sheet.dart';
import 'package:flutter/material.dart';

import '../data/models/country.dart';
import 'country_view_model.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({super.key});

  final CountryViewModel countryViewModel = CountryViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              //TODO: Replace with country image with Url
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
          child: FutureBuilder<Country?>(
            future: countryViewModel.getCountry('DZ'), // Use the getCountry method to get the data
            builder: (context, snapshot) {
              // Handle loading state
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              // Handle error state
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              // Handle no data state
              else if (snapshot.data == null) {
                return Center(child: Text('No data found!'));
              }
              // Handle success state (when data is available)
              else {
                Country country = snapshot.data!; // Get the country from snapshot
                return CountrySheet(country: country); // Pass the country data to your CountrySheet widget
              }
            },
          ),
        ),
      ],
    );
  }
}
