import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Genre {
  Genre({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  Genre.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'];
}