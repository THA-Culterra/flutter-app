import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Country/data/models/country.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<(String, String)> _searchResults = [];
  List<(String, String)> get searchResults => _searchResults;

  // This function fetches country details by ID
  Future<Country?> getCountryById(String id) async {
    try {
      final countryDoc = await _firestore.collection('countries').doc(id.toUpperCase()).get();
      if (countryDoc.exists && countryDoc.data() != null) {
        try {
          final country = Country.fromFirestore(countryDoc);
          return country;
        } catch (e, stacktrace) {
          print('🔥 Error parsing Country: $e');
          print('🔥 Stacktrace: $stacktrace');
          print('🔥 Raw data that caused the error: ${countryDoc.data()}');
          rethrow;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("❌ Error fetching country data: $e");
      return null;
    }
  }

  Future<void> searchCountriesByName(String query) async {
    if (query.isEmpty) {
      clearSearchResults();
    } else {
      try {
        String capitalizedQuery = query[0].toUpperCase() + query.substring(1).toLowerCase();

        final snapshot = await _firestore
            .collection('countries')
            .where('name', isGreaterThanOrEqualTo: capitalizedQuery)
            .where('name', isLessThan: '$capitalizedQuery\uf8ff')
            .get();

        _searchResults = snapshot.docs
            .map((doc) => (doc.id, doc['name'] as String))
            .toList();

        print("Fetched ${_searchResults.length} countries:");
        for (var result in _searchResults) {
          print('ID: ${result.$1}, Name: ${result.$2}');
        }
      } catch (e) {
        print('Error fetching countries: $e');
      }
    }
    notifyListeners();
  }

  void clearSearchResults() {
    _searchResults = [];
    notifyListeners();
  }
}