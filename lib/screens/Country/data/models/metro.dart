import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Metro {
  Metro({
    required this.city,
    required this.image,
  });

  String city;
  String image;

  Metro.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        image = json['image'];
}
