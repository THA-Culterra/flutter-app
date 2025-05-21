import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  History({
    required this.reviews,
    required this.nationalDay,
    required this.publicHolidays,
    required this.keyEvents,
  });

  final NamedDate nationalDay;
  final List<NamedDate> publicHolidays;
  final List<NamedDate> keyEvents;
  final List<DocumentReference> reviews;

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      nationalDay: _convertSinglePair(map['nationalDay']),
      publicHolidays: _convertPairList(map['publicHolidays']),
      keyEvents: _convertPairList(map['keyEvents']),
      reviews: (map['reviews'] as List<dynamic>? ?? [])
          .whereType<DocumentReference>()
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nationalDay': [nationalDay.name, Timestamp.fromDate(nationalDay.date)],
      'publicHolidays': publicHolidays.map((e) => [e.name, Timestamp.fromDate(e.date)]).toList(),
      'keyEvents': keyEvents.map((e) => [e.name, Timestamp.fromDate(e.date)]).toList(),
      'reviews': reviews,
    };
  }

  factory History.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return History.fromMap(data);
  }

  Map<String, dynamic> toFirestore() => toMap();

  // Helper for a single pair
  static NamedDate _convertSinglePair(dynamic raw) {
    if (raw is List && raw.length == 2) {
      return NamedDate(
        name: raw[0] as String,
        date: (raw[1] as Timestamp).toDate(),
      );
    }
    return NamedDate(name: 'Unknown', date: DateTime(1900));
  }

  // Helper for lists of [String, Timestamp]
  static List<NamedDate> _convertPairList(dynamic list) {
    if (list == null || list is! List) return [];
    return list
        .whereType<List>()
        .where((e) => e.length == 2)
        .map((e) => NamedDate(
      name: e[0] as String,
      date: (e[1] as Timestamp).toDate(),
    ))
        .toList();
  }
}

class NamedDate {
  final String name;
  final DateTime date;

  NamedDate({required this.name, required this.date});
}