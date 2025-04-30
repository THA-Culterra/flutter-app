import 'package:json_annotation/json_annotation.dart';

part 'emergency.g.dart';

@JsonSerializable()
class Emergency{
  Emergency({
    required this.police,
    required this.ambulance,
    required this.fire,
  });

  int  police ;
  int  ambulance ;
  int  fire ;

  // A factory constructor to create a Cuisine object from JSON
  factory Emergency.fromJson(Map<String, dynamic> json) => _$EmergencyFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$EmergencyToJson(this);

}