import 'package:json_annotation/json_annotation.dart';

import 'driving_side.dart';
import 'metro.dart';

part 'transport.g.dart';
@JsonSerializable()
class Transport {
  Transport({
    required this.airports,
    required this.drivingSide,
    required this.taxiApps,
    required this.metroSystems,
  });

  List<String>  airports ;
  DrivingSide  drivingSide ;
  List<String>  taxiApps ;
  List<Metro>  metroSystems;

  // A factory constructor to create a Cuisine object from JSON
  factory Transport.fromJson(Map<String, dynamic> json) => _$TransportFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$TransportToJson(this);
}
