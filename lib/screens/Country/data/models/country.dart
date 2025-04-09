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
}