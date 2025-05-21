import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/data/models/taxi_app.dart';

import '../../../Data/review.dart';
import 'airport.dart';
import 'driving_side.dart';
import 'metro.dart';

class Transport {
  Transport({
    required this.airports,
    required this.drivingSide,
    required this.taxiApps,
    required this.metroSystems,
    required this.reviews,
  });

  final List<Airport> airports;
  final DrivingSide drivingSide;
  final List<TaxiApp> taxiApps;
  final List<Metro> metroSystems;
  final List<Review> reviews;

  /// Basic deserialization from Firestore-compatible map
  factory Transport.fromMap(Map<String, dynamic> map) {
    return Transport(
      airports: (map['airports'] as List<dynamic>? ?? [])
          .map((e) => Airport.fromMap(e as Map<String, dynamic>))
          .toList(),
      drivingSide: DrivingSide.values.byName(map['drivingSide'] as String? ?? 'right'),
      taxiApps: [], // ignored here, hydration loads these
      metroSystems: (map['metroSystems'] as List<dynamic>? ?? [])
          .map((e) => Metro.fromMap(e as Map<String, dynamic>))
          .toList(),
      reviews: [], // ignored here, hydration loads these
    );
  }

  /// Convert Transport to Firestore map (without reviews or hydrated taxiApps)
  Map<String, dynamic> toMap() {
    return {
      'airports': airports.map((a) => a.toMap()).toList(),
      'drivingSide': drivingSide.name,
      'taxiApps': taxiApps.map((t) => FirebaseFirestore.instance.doc('taxiApps/${t.id}')).toList(),
      'metroSystems': metroSystems.map((m) => m.toMap()).toList(),
    };
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();

  static Future<Transport> fromMapWithHydration(Map<String, dynamic> map) async {
    // Hydrate taxiApps
    final taxiAppRefs = (map['taxiApps'] as List<dynamic>? ?? [])
        .whereType<DocumentReference>()
        .toList();

    final taxiApps = await Future.wait(taxiAppRefs.map((ref) async {
      final doc = await ref.get();
      return TaxiApp.fromFirestore(doc);
    }));

    // Reviews can't be hydrated from here (need DocumentSnapshot)
    return Transport(
      airports: (map['airports'] as List<dynamic>? ?? [])
          .map((e) => Airport.fromMap(e as Map<String, dynamic>))
          .toList(),
      drivingSide: DrivingSide.values.byName(map['drivingSide'] as String? ?? 'right'),
      taxiApps: taxiApps,
      metroSystems: (map['metroSystems'] as List<dynamic>? ?? [])
          .map((e) => Metro.fromMap(e as Map<String, dynamic>))
          .toList(),
      reviews: [], // Subcollection hydration only possible via doc
    );
  }

  static Future<Transport> fromFirestore(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;

    final base = await fromMapWithHydration(data);

    final reviewSnapshot = await doc.reference.collection('reviews').get();
    final reviews = await Future.wait(
      reviewSnapshot.docs.map(Review.fromFirestoreWithHydration),
    );

    return Transport(
      airports: base.airports,
      drivingSide: base.drivingSide,
      taxiApps: base.taxiApps,
      metroSystems: base.metroSystems,
      reviews: reviews,
    );
  }
}
