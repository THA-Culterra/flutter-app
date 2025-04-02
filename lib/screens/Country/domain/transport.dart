import 'package:json_annotation/json_annotation.dart';

import 'driving_side.dart';
import 'metro.dart';

@JsonSerializable()
class Transport {
  Transport(
      this.airports,
      this.drivingSide,
      this.taxiApps,
      this.metroSystems,
      );

  List<String>  airports ;
  DrivingSide  drivingSide ;
  List<String>  taxiApps ;
  List<Metro>  metroSystems;
}
