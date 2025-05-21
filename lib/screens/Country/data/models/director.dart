import 'package:cloud_firestore/cloud_firestore.dart';

import 'person.dart';

class Director implements Person {
  Director({
    required this.id,
    required this.name,
    required this.age,
  });

  final String id;

  @override
  final String name;

  @override
  final int age;

  /// Create a Director object from Firestore document
  factory Director.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Director(
      id: doc.id,
      name: data['name'] as String,
      age: data['age'] as int,
    );
  }

  /// Convert Director to Firestore-friendly map
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}