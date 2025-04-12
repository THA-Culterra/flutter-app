import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Emergency {
  Emergency({
    required this.police,
    required this.ambulance,
    required this.fire,
  });

  int police;
  int ambulance;
  int fire;

  Emergency.fromJson(Map<String, dynamic> json)
      : police = json['police'],
        ambulance = json['ambulance'],
        fire = json['fire'];
}