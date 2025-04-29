import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Country/presentation/country_screen.dart';
import '../../Profile/presentation/profileSheet.dart';
import '../../Widgets/world_map.dart';
import 'homeViewModel.dart'; // Import the Profile screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
            return WorldMap(
              onCountryTap: (id, name) async {
                // Fetch country details by ID from the HomeViewModel
                var country = await viewModel.getCountryById(id);

                // If country data is found, navigate to the CountryScreen
                if (country != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryScreen(country: country),
                    ),
                  );
                } else {
                  // Handle case where the country doesn't exist or fetch fails
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("We will ad this country soon...")),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}