enum Religion {
  islam,
  christianity,
  judaism,
  hinduism;

  /// Converts a string to a Religion enum
  static Religion fromString(String value) {
    return Religion.values.firstWhere(
          (e) => e.name == value,
      orElse: () => Religion.islam, // default fallback
    );
  }

  /// Converts a Religion enum to a string
  String toMap() => name;

  /// Converts Firestore data to Religion
  static Religion fromMap(dynamic value) => fromString(value as String);

  /// Converts Religion to Firestore-compatible data
  String toFirestore() => toMap();
}