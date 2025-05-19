

import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String authorId;
  final String text;

  Review({
    required this.id,
    required this.authorId,
    required this.text,
  });

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'] ?? '',
      authorId: map['authorId'] ?? '',
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authorId': authorId,
      'text': text,
    };
  }

  Review copyWith({
    String? id,
    String? authorId,
    String? text,
  }) {
    return Review(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      text: text ?? this.text,
    );
  }

  factory Review.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Review(
      id: doc.id,
      authorId: data['authorId'] ?? '',
      text: data['text'] ?? '',
    );
  }
}