import 'package:cloud_firestore/cloud_firestore.dart';

class Author {
  final String id;
  final String name;
  final String photoUrl;

  Author({
    required this.id,
    required this.name,
    required this.photoUrl,
  });

  /// From Firestore DocumentSnapshot
  factory Author.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Author(
      id: doc.id,
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  /// From map (used when doc ID is available separately)
  factory Author.fromMap(Map<String, dynamic> map, {required String id}) {
    return Author(
      id: id,
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
    );
  }

  /// To Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}