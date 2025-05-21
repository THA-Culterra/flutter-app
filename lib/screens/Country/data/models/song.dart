import 'package:cloud_firestore/cloud_firestore.dart';

import 'singer.dart';

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
  final Singer singer;
  final String youtubeUrl;

  /// Firestore stores the singer as a reference
  static Future<Song> fromFirestoreWithHydration(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final singerRef = data['singer'] as DocumentReference;

    final singerDoc = await singerRef.get();
    final singer = Singer.fromFirestore(singerDoc);

    return Song(
      id: doc.id,
      name: data['name'] as String? ?? '',
      views: data['views'] as int? ?? 0,
      imageUrl: data['imageUrl'] as String? ?? '',
      singer: singer,
      youtubeUrl: data['youtubeUrl'] as String? ?? '',
    );
  }

  /// Convert to Firestore-compatible map (store reference instead of object)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'views': views,
      'imageUrl': imageUrl,
      'singer': FirebaseFirestore.instance.collection('singers').doc(singer.id),
      'youtubeUrl': youtubeUrl,
    };
  }

  /// Alias for toMap
  Map<String, dynamic> toFirestore() => toMap();
}