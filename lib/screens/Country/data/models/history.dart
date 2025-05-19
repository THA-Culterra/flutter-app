import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  History({
    required this.reviews,
    required this.nationalDay,
    required this.publicHolidays,
    required this.keyEvents,
  });

  final Map<String, DateTime> nationalDay;
  final Map<String, DateTime> publicHolidays;
  final Map<String, DateTime> keyEvents;
  final List<DocumentReference> reviews;

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      nationalDay: _convertMapToDateTime(map['nationalDay']),
      publicHolidays: _convertMapToDateTime(map['publicHolidays']),
      keyEvents: _convertMapToDateTime(map['keyEvents']),
      reviews: (map['reviews'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nationalDay': _convertMapToTimestamp(nationalDay),
      'publicHolidays': _convertMapToTimestamp(publicHolidays),
      'keyEvents': _convertMapToTimestamp(keyEvents),
      'reviews': reviews,
    };
  }

  factory History.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return History.fromMap(data);
  }

  Map<String, dynamic> toFirestore() => toMap();

  // Helper methods
  static Map<String, DateTime> _convertMapToDateTime(dynamic map) {
    if (map == null) return {};
    return Map<String, DateTime>.from(
      (map as Map).map((key, value) =>
          MapEntry(key as String, (value as Timestamp).toDate())),
    );
  }

  static Map<String, Timestamp> _convertMapToTimestamp(Map<String, DateTime> map) {
    return map.map((key, value) => MapEntry(key, Timestamp.fromDate(value)));
  }
}
