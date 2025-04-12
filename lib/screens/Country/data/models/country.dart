import 'package:culterra/screens/Country/data/models/athletics.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cinema.dart';
import 'cuisine.dart';
import 'emergency.dart';
import 'dish.dart';
import 'history.dart';
import 'music.dart';
import 'religion.dart';
import 'sport.dart';
import 'transport.dart';

@JsonSerializable()
class Country{
  Country({required this.id,
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
    required this.emergency});

  String  id ;
  String  name ;
  String imageUrl;
  String  description ;
  String  capital ;
  List<String>  majorCities ;
  List<String>  languages ;
  String  currency ;
  Religion  religion ;
  String  dialCode ;
  Cuisine cuisine ;
  Music  music ;
  Cinema  cinema ;
  History  history ;
  Athletics  athletics ;
  Transport  transport ;
  Emergency  emergency;

  Country.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        description = json['description'],
        capital = json['capital'],
        majorCities = List<String>.from(json['majorCities']),
        languages = List<String>.from(json['languages']),
        currency = json['currency'],
        religion = Religion.values.firstWhere(
              (e) => e.toString().split('.').last == json['religion'],
          orElse: () => Religion.islam, // default if not matched
        ),
        dialCode = json['dialCode'],
        cuisine = Cuisine.fromJson(json['cuisine']),
        music = Music.fromJson(json['music']),
        cinema = Cinema.fromJson(json['cinema']),
        history = History.fromJson(json['history']),
        athletics = Athletics.fromJson(json['athletics']),
        transport = Transport.fromJson(json['transport']),
        emergency = Emergency.fromJson(json['emergency']);
}