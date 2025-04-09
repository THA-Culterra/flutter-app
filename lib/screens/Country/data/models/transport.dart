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

  List<String>  airports ;
  DrivingSide  drivingSide ;
  List<String>  taxiApps ;
  List<Metro>  metroSystems;
}
