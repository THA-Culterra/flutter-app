import 'package:cloud_firestore/cloud_firestore.dart';
import 'person.dart';

class Actor implements Person {

  final String id;
  @override
  final String name;

  @override
  final int age;

  Actor({
    required this.id,
    required this.name,
    required this.age,
  });

  /// Factory constructor to create an Actor from Firestore
  factory Actor.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Actor(
      id: doc.id,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
    );
  }

  /// Converts an Actor instance to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
