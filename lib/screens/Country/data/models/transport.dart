import 'package:json_annotation/json_annotation.dart';

import 'driving_side.dart';
import 'metro.dart';

@JsonSerializable()
class Transport {
  Transport({
    required this.airports,
    required this.drivingSide,
    required this.taxiApps,
    required this.metroSystems,
  });

  List<String> airports;
  DrivingSide drivingSide;
  List<String> taxiApps;
  List<Metro> metroSystems;

  Transport.fromJson(Map<String, dynamic> json)
      : airports = List<String>.from(json['airports']),
        drivingSide = DrivingSide.values
            .firstWhere((e) => e.toString() == 'DrivingSide.' + json['drivingSide']),
        taxiApps = List<String>.from(json['taxiApps']),
        metroSystems = (json['metroSystems'] as List)
            .map((metroJson) => Metro.fromJson(metroJson))
            .toList();
}
