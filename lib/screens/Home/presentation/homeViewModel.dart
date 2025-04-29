import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Country/data/models/country.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // This function fetches country details by ID
  Future<Country?> getCountryById(String id) async {
    try {
      var countryDoc = await _firestore.collection('countries').doc(id.toUpperCase()).get();
      final data = countryDoc.data();
      if (data != null) {
        try {
          final country = Country.fromJson(data);
          return country;
        } catch (e, stacktrace) {
          print('🔥 Error parsing Country: $e');
          print('🔥 Stacktrace: $stacktrace');
          print('🔥 Raw data that caused the error: $data');
          rethrow; // Or return null depending on your use case
        }
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching country data: $e");
      return null;
    }
  }
}