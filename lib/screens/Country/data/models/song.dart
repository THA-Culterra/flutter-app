import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  Song({
    required this.id,
    required this.name,
    required this.views,
    required this.imageUrl,
    required this.singer,
    required this.youtubeUrl,
  });

  final String id;
  final String name;
  final int views;
  final String imageUrl;
  final String singer;
  final String youtubeUrl;

  /// Create Song from Firestore-compatible map and document ID
  factory Song.fromMap(Map<String, dynamic> map, {required String id}) {
    return Song(
      id: id,
      name: map['name'] as String? ?? '',
      views: map['views'] as int? ?? 0,
      imageUrl: map['imageUrl'] as String? ?? '',
      singer: map['singer'] as String? ?? '',
      youtubeUrl: map['youtubeUrl'] as String? ?? '',
    );
  }

  /// Create Song from Firestore DocumentSnapshot
  factory Song.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Song.fromMap(data, id: doc.id);
  }

  /// Convert Song to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'views': views,
      'imageUrl': imageUrl,
      'singer': singer,
      'youtubeUrl': youtubeUrl,
    };
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}