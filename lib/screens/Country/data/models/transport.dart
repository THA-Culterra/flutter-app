import 'package:cloud_firestore/cloud_firestore.dart';

import 'airport.dart';
import 'driving_side.dart';
import 'metro.dart';

class Transport {
  Transport({
    required this.airports,
    required this.drivingSide,
    required this.taxiApps,
    required this.metroSystems,
  });

  List<Airport> airports;
  DrivingSide drivingSide;
  List<DocumentReference> taxiApps;
  List<Metro> metroSystems;

  /// Create Transport from a Firestore-compatible map
  factory Transport.fromMap(Map<String, dynamic> map) {
    return Transport(
      airports: (map['airports'] as List<dynamic>? ?? [])
          .map((e) => Airport.fromMap(e as Map<String, dynamic>))
          .toList(),
      drivingSide: DrivingSide.values.byName(map['drivingSide'] as String? ?? 'right'),
      taxiApps: (map['taxiApps'] as List<dynamic>? ?? [])
          .whereType<DocumentReference>()
          .toList(),
      metroSystems: (map['metroSystems'] as List<dynamic>? ?? [])
          .map((e) => Metro.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Convert Transport object to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'airports': airports.map((a) => a.toMap()).toList(),
      'drivingSide': drivingSide.name,
      'taxiApps': taxiApps,
      'metroSystems': metroSystems.map((m) => m.toMap()).toList(),
    };
  }

  /// Create Transport from Firestore DocumentSnapshot
  factory Transport.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Transport.fromMap(data);
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}
