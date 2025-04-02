import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Genre{
  Genre(
      this.name,
      this.image,
      );

  String  name ;
  String  image ;
  }