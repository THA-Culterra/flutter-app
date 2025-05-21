import 'package:cloud_firestore/cloud_firestore.dart';

class Metro {
  Metro({
    required this.city,
    required this.image,
  });

  String city;
  String image;

  factory Metro.fromMap(Map<String, dynamic> map) {
    return Metro(
      city: map['city'] as String? ?? '',
      image: map['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'image': image,
    };
  }

  factory Metro.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Metro.fromMap(data);
  }

  Map<String, dynamic> toFirestore() => toMap();
}
