import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/data/models/genre.dart';
import 'package:culterra/screens/Widgets/report_suggestion.dart';
import 'package:culterra/screens/Widgets/review_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/models/song.dart';

class GenreView extends StatefulWidget {
  const GenreView({super.key, required this.genre});

  final Genre genre;

  @override
  State<GenreView> createState() => _GenreViewState();
}

class _GenreViewState extends State<GenreView> {
  final TextEditingController commentController = TextEditingController();

  final ja.AudioPlayer _player = ja.AudioPlayer();
  String? _currentlyPlayingId;
  ja.PlayerState? _playerState;

  @override
  void initState() {
    super.initState();

    // Listen to playback state
    _player.playerStateStream.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dish image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  widget.genre.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.genre.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 16),
                    const Text("Expert reviews", style: TextStyle(fontSize: 16)),

                    if (widget.genre.reviews.isNotEmpty)
                      ReviewCard(
                        reviews: widget.genre.reviews,
                        controller: commentController,
                        onPost: postReview,
                      )
                    else
                      const Text("No reviews yet."),
                  ],
                ),
              ),

              ReportSuggestion(),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowBuilderSongs(String title, List<Song> songs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
        Column(
          children:
          widget.genre.topSongs.map((song) {
            final videoId = YoutubePlayer.convertUrlToId(song.youtubeUrl);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: song.imageUrl,
                      height: 90,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            song.singer.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              _isPlaying(videoId ?? '')
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              if (_isPlaying(videoId ?? '')) {
                                await _player.pause();
                              } else {
                                await _playAudio(song.youtubeUrl, videoId ?? '');
                              }
                            },
                          ),
                          Text(
                            '${song.views} views',
                            style: const TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _playAudio(String youtubeUrl, String videoId) async {
    final yt = YoutubeExplode();
    try {
      final manifest = await yt.videos.streamsClient.getManifest(videoId);
      final audioStreamInfo = manifest.audioOnly
          .where((stream) => stream.codec.mimeType == 'audio/mp4')
          .withHighestBitrate();

      final url = audioStreamInfo.url.toString();
      await _player.setUrl(url);
      await _player.play();

      setState(() {
        _currentlyPlayingId = videoId;
      });
    } catch (e) {
      print('Playback error: $e');
    } finally {
      yt.close();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  bool _isPlaying(String videoId) {
    return _currentlyPlayingId == videoId &&
        _playerState?.playing == true &&
        _playerState?.processingState != ja.ProcessingState.completed;
  }

  Future<void> postReview() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final reviewText = commentController.text.trim();
    if (reviewText.isEmpty) return;

    final reviewData = {
      'author': FirebaseFirestore.instance.collection('users').doc(user.uid),
      'text': reviewText,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('genres')
        .doc(widget.genre.id)
        .collection('reviews')
        .add(reviewData);

    commentController.clear();
  }
}
