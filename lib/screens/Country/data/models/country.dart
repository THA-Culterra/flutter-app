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
  factory Country.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Country.fromMap(data..['id'] = doc.id);
  }

  /// Construct Country from a plain map
  factory Country.fromMap(Map<String, dynamic> map) {
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
      cuisine: Cuisine.fromMap(map['cuisine'] ?? {}),
      music: Music.fromMap(map['music'] ?? {}),
      cinema: Cinema.fromMap(map['cinema'] ?? {}),
      history: History.fromMap(map['history'] ?? {}),
      athletics: Athletics.fromMap(map['athletics'] ?? {}),
      transport: Transport.fromMap(map['transport'] ?? {}),
      emergency: Emergency.fromMap(map['emergency'] ?? {}),
    );
  }

  /// Convert Country to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'capital': capital,
      'majorCities': majorCities,
      'languages': languages,
      'currency': currency,
      'religion': religion.toMap(),
      'dialCode': dialCode,
      'cuisine': cuisine.toMap(),
      'music': music.toMap(),
      'cinema': cinema.toMap(),
      'history': history.toMap(),
      'athletics': athletics.toMap(),
      'transport': transport.toMap(),
      'emergency': emergency.toMap(),
    };
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}