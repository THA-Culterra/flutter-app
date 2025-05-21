import 'package:cloud_firestore/cloud_firestore.dart';

class Emergency {
  Emergency({
    required this.police,
    required this.ambulance,
    required this.fire,
  });

  final int police;
  final int ambulance;
  final int fire;

  factory Emergency.fromMap(Map<String, dynamic> map) {
    return Emergency(
      police: map['police'] as int,
      ambulance: map['ambulance'] as int,
      fire: map['fire'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'police': police,
      'ambulance': ambulance,
      'fire': fire,
    };
  }

  factory Emergency.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Emergency.fromMap(data);
  }

  Map<String, dynamic> toFirestore() => toMap();
}