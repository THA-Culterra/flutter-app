import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/CTCardData.dart';
import 'person.dart';

class Athlete implements Person, CTCardData {
  Athlete({
    required this.id,
    required this.name,
    required this.age,
    required this.sportName,
    required this.imageUrl,
  });

  final String id;

  @override
  final String name;

  @override
  final int age;

  final String sportName;

  @override
  final String imageUrl;

  /// Create an Athlete object from Firestore document
  factory Athlete.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Athlete(
      id: doc.id,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      sportName: data['sportName'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  /// Convert Athlete to Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'sportName': sportName,
      'imageUrl': imageUrl,
    };
  }
}