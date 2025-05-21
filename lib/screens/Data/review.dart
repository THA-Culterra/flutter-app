import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/data/models/CulterraUser.dart';

import '../Country/data/models/author.dart';

class Review {
  final String id;
  final Author author;
  final String text;

  Review({
    required this.id,
    required this.author,
    required this.text,
  });

  /// Hydrated from Firestore, loading the referenced Author document
  static Future<Review> fromFirestoreWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;

    final DocumentReference authorRef = data['author'] as DocumentReference;
    final authorDoc = await authorRef.get();
    final author = Author.fromFirestore(authorDoc);

    return Review(
      id: doc.id,
      author: author,
      text: data['text'] ?? '',
    );
  }

  /// Convert Review to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'author': FirebaseFirestore.instance.collection('authors').doc(author.id),
      'text': text,
    };
  }

  /// Optional: construct from map only (non-hydrated, with preloaded author)
  factory Review.fromMap(Map<String, dynamic> map, {required String id, required Author author}) {
    return Review(
      id: id,
      author: author,
      text: map['text'] ?? '',
    );
  }

  Review copyWith({
    String? id,
    Author? author,
    String? text,
  }) {
    return Review(
      id: id ?? this.id,
      author: author ?? this.author,
      text: text ?? this.text,
    );
  }
}