import 'package:cloud_firestore/cloud_firestore.dart';

class TaxiApp {
  String id;
  String name;
  String imageUrl;

  TaxiApp({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  /// Create a TaxiApp object from a Firestore-compatible map
  factory TaxiApp.fromMap(Map<String, dynamic> map) {
    return TaxiApp(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
    );
  }

  /// Convert TaxiApp object to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  /// Create TaxiApp from Firestore DocumentSnapshot
  factory TaxiApp.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TaxiApp.fromMap({
      ...data,
      'id': doc.id, // Ensure the document ID is included
    });
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}