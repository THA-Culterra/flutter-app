import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/domain/entities/CTCardData.dart';
import 'person.dart';

class Actor implements Person, CTCardData {

  final String id;
  @override
  final String name;

  @override
  final String imageUrl;

  @override
  final int age;

  Actor({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl
  });

  /// Factory constructor to create an Actor from Firestore
  factory Actor.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Actor(
      id: doc.id,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  /// Converts an Actor instance to a Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'imageUrl': imageUrl,
    };
  }
}
