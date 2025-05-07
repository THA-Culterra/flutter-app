import 'package:culterra/screens/Country/presentation/country_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            CachedNetworkImage(
              imageUrl: country.imageUrl,
              width: double.infinity,
              height: 700,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                width: 56,
                height: 56,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
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
