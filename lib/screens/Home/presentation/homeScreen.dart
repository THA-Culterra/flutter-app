import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Country/data/models/country.dart';
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
      child: Builder(
        builder: (context) {
          final searchController = TextEditingController();
          return Scaffold(
            appBar: appBar(
              user,
              searchController,
                  (value) {
                context.read<HomeViewModel>().searchCountriesByName(value);
              },
            ),
            body: Consumer<HomeViewModel>(
              builder: (context, viewModel, _) {
                return Stack(
                  children: [
                    // World map as base layer
                    WorldMap(
                      onCountryTap: (id, name) async {
                        var country = await viewModel.getCountryById(id);
                        if (country != null) {
                          context.read<HomeViewModel>().clearSearchResults();
                          pushCountry(context, country);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("We will add this country soon...")),
                          );
                        }
                      },
                    ),

                    // Search results overlay
                    if (viewModel.searchResults.isNotEmpty)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Material(
                          elevation: 4,
                          color: Colors.white,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.searchResults.length,
                            itemBuilder: (context, index) {
                              final (id, name) = viewModel.searchResults[index];
                              return ListTile(
                                title: Text(name),
                                onTap: () async {
                                  final country = await viewModel.getCountryById(id);
                                  context.read<HomeViewModel>().clearSearchResults();
                                  searchController.clear();
                                  if (country != null) {
                                    pushCountry(context, country);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  AppBar appBar(User? user, TextEditingController controller, void Function(String) onChanged) {
    return AppBar(
      backgroundColor: Color(0xFF0E288F),
      elevation: 0,
      title: Row(
        children: [
          // Profile picture
          CircleAvatar(
            radius: 20,
            backgroundImage: user != null && user.photoURL != null && user.photoURL!.isNotEmpty
                ? NetworkImage(user.photoURL!)
                : null,
              child: (user == null || user.photoURL == null || user.photoURL!.isEmpty)
                  ? Icon(Icons.person, color: Colors.grey[700])
                  : null,
          ),

          SizedBox(width: 12),

          // Expanded search bar
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600]),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pushCountry(BuildContext context, Country country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryScreen(country: country),
      ),
    );
  }
}