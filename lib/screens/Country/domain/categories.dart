import 'package:culterra/screens/Country/presentation/features/cinema.dart';
import 'package:culterra/screens/Country/presentation/features/emergency.dart';
import 'package:culterra/screens/Country/presentation/features/food.dart';
import 'package:culterra/screens/Country/presentation/features/history.dart';
import 'package:culterra/screens/Country/presentation/features/key_info.dart';
import 'package:culterra/screens/Country/presentation/features/music.dart';
import 'package:culterra/screens/Country/presentation/features/sports.dart';
import 'package:culterra/screens/Country/presentation/features/transport.dart';
import 'package:flutter/material.dart';

enum CountryCategory {
  keyInfo("Key Info", "key-info"),
  food("Food", "food"),
  music("Music", "music"),
  cinema("Cinema", "cinema"),
  history("History", "history"),
  sports("Sports", "sport"),
  transport("Transport", "transport"),
  emergencies("Emergencies", "emergency");

  Widget get content {
    switch (this) {
      case CountryCategory.keyInfo:
        return KeyInfoScreen();
      case CountryCategory.food:
        return FoodScreen();
      case CountryCategory.music:
        return MusicScreen();
      case CountryCategory.cinema:
        return CinemaScreen();
      case CountryCategory.history:
        return HistoryScreen();
      case CountryCategory.sports:
        return SportScreen();
      case CountryCategory.transport:
        return TransportScreen();
      case CountryCategory.emergencies:
        return EmergencyScreen();
    }
  }

  final String displayName;
  final String icon;
  const CountryCategory(this.displayName, this.icon);
}