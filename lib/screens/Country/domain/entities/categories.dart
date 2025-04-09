import 'package:culterra/screens/Country/presentation/features/cinema.dart';
import 'package:culterra/screens/Country/presentation/features/emergency.dart';
import 'package:culterra/screens/Country/presentation/features/cuisine.dart';
import 'package:culterra/screens/Country/presentation/features/history.dart';
import 'package:culterra/screens/Country/presentation/features/key_info.dart';
import 'package:culterra/screens/Country/presentation/features/music.dart';
import 'package:culterra/screens/Country/presentation/features/athletic.dart';
import 'package:culterra/screens/Country/presentation/features/transport.dart';
import 'package:flutter/material.dart';

import '../../data/models/country.dart';

enum CountryCategory {
  keyInfo("Key Info", "key-info"),
  food("Food", "food"),
  music("Music", "music"),
  cinema("Cinema", "cinema"),
  history("History", "history"),
  sports("Sports", "sport"),
  transport("Transport", "transport"),
  emergencies("Emergencies", "emergency");

  Widget buildContent(Country country) {
    switch (this) {
      case CountryCategory.keyInfo:
        return KeyInfoScreen(country: country);
      case CountryCategory.food:
        return CuisineScreen(cuisine: country.cuisine);
      case CountryCategory.music:
        return MusicScreen(music: country.music);
      case CountryCategory.cinema:
        return CinemaScreen(cinema: country.cinema);
      case CountryCategory.history:
        return HistoryScreen(history: country.history);
      case CountryCategory.sports:
        return AthleticScreen(athletics: country.athletics);
      case CountryCategory.transport:
        return TransportScreen(transport: country.transport);
      case CountryCategory.emergencies:
        return EmergencyScreen(emergency: country.emergency);
    }
  }

  final String displayName;
  final String icon;
  const CountryCategory(this.displayName, this.icon);
}