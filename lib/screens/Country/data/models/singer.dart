import 'package:cloud_firestore/cloud_firestore.dart';

import 'person.dart';

class Singer implements Person {
  Singer({
    required this.id,
    required this.name,
    required this.age,
    required this.songs,
  });

  final String id;

  @override
  final String name;

  @override
  final int age;

  final List<DocumentReference> songs;

  /// Create Singer from Firestore map + id
  factory Singer.fromMap(Map<String, dynamic> map, {required String id}) {
    return Singer(
      id: id,
      name: map['name'] as String? ?? '',
      age: map['age'] as int? ?? 0,
      songs: (map['songs'] as List<dynamic>?)
          ?.whereType<DocumentReference>()
          .toList() ??
          [],
    );
  }

  /// Create Singer from Firestore DocumentSnapshot
  factory Singer.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Singer.fromMap(data, id: doc.id);
  }

  /// Convert Singer to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'songs': songs,
    };
  }

  /// Convert Singer to Firestore (alias for toMap)
  Map<String, dynamic> toFirestore() => toMap();
}