import 'package:json_annotation/json_annotation.dart';

part 'metro.g.dart';
@JsonSerializable()
class Metro{
  Metro({
    required this.city,
    required this.image,
  });

  String  city ;
  String  image ;

  // A factory constructor to create a Cuisine object from JSON
  factory Metro.fromJson(Map<String, dynamic> json) => _$MetroFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$MetroToJson(this);
}
