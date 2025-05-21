import 'package:cloud_firestore/cloud_firestore.dart';

import 'cinema.dart';
import 'cuisine.dart';
import 'emergency.dart';
import 'history.dart';
import 'music.dart';
import 'religion.dart';
import 'transport.dart';
import 'athletics.dart';

class Country {
  Country({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.capital,
    required this.majorCities,
    required this.languages,
    required this.currency,
    required this.religion,
    required this.dialCode,
    required this.cuisine,
    required this.music,
    required this.cinema,
    required this.history,
    required this.athletics,
    required this.transport,
    required this.emergency,
  });

  String id;
  String name;
  String imageUrl;
  String description;
  String capital;
  List<String> majorCities;
  List<String> languages;
  String currency;
  Religion religion;
  String dialCode;
  Cuisine cuisine;
  Music music;
  Cinema cinema;
  History history;
  Athletics athletics;
  Transport transport;
  Emergency emergency;

  /// Construct Country from Firestore DocumentSnapshot
  static Future<Country> fromFirestore(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return await Country.fromMapWithHydration(data);
  }

  /// Construct Country from a plain map
  static Future<Country> fromMapWithHydration(Map<String, dynamic> map) async {
    late Music music;
    late Cuisine cuisine;
    late Athletics athletics;
    late Cinema cinema;
    late Transport transport;

    try {
      print("Hydrating music, raw data: ${map['music']}");
      music = await Music.fromMapWithHydration(map['music'] ?? {});
    } catch (e, stack) {
      print("Error hydrating music: $e\n$stack");
      rethrow;
    }

    try {
      print("Hydrating cuisine, raw data: ${map['cuisine']}");
      cuisine = await Cuisine.fromMapWithHydration(map['cuisine'] ?? {});
    } catch (e, stack) {
      print("Error hydrating cuisine: $e\n$stack");
      rethrow;
    }

    try {
      print("Hydrating athletics, raw data: ${map['athletics']}");
      athletics = await Athletics.fromMapWithHydration(map['athletics'] ?? {});
    } catch (e, stack) {
      print("Error hydrating athletics: $e\n$stack");
      rethrow;
    }

    try {
      print("Hydrating cinema, raw data: ${map['cinema']}");
      cinema = await Cinema.fromMapWithHydration(map['cinema'] ?? {});
    } catch (e, stack) {
      print("Error hydrating cinema: $e\n$stack");
      rethrow;
    }

    try {
      print("Hydrating transport, raw data: ${map['transport']}");
      transport = await Transport.fromMapWithHydration(map['transport'] ?? {});
    } catch (e, stack) {
      print("Error hydrating transport: $e\n$stack");
      rethrow;
    }

    return Country(
      id: map['id'] as String,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      capital: map['capital'] ?? '',
      majorCities: List<String>.from(map['majorCities'] ?? []),
      languages: List<String>.from(map['languages'] ?? []),
      currency: map['currency'] ?? '',
      religion: Religion.fromMap(map['religion'] ?? {}),
      dialCode: map['dialCode'] ?? '',
      cuisine: cuisine,
      music: music,
      cinema: cinema,
      history: History.fromMap(map['history'] ?? {}),
      athletics: athletics,
      transport: transport,
      emergency: Emergency.fromMap(map['emergency'] ?? {}),
    );
  }
}