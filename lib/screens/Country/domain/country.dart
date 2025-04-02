import 'package:json_annotation/json_annotation.dart';

import 'cinema.dart';
import 'emergency.dart';
import 'food.dart';
import 'history.dart';
import 'music.dart';
import 'religion.dart';
import 'sport.dart';
import 'transport.dart';

@JsonSerializable()
class Country{
  Country(
      this.id,
      this.name,
      this.description,
      this.capitale,
      this.majorCities,
      this.language,
      this.currency,
      this.religion,
      this.dialCode,
      this.food,
      this.music,
      this.cinema,
      this.history,
      this.sport,
      this.transport,
      this.emergency,
      );

  String  id ;
  String  name ;
  String  description ;
  String  capitale ;
  List<String>  majorCities ;
  String  language ;
  String  currency ;
  Religion  religion ;
  String  dialCode ;
  List<Food>  food ;
  Music  music ;
  Cinema  cinema ;
  History  history ;
  Sport  sport ;
  Transport  transport ;
  Emergency  emergency ;

}