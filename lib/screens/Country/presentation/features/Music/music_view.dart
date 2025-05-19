import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/report_suggestion.dart';
import '../../../data/models/music.dart';
import '../../../data/models/song.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key, required this.music});

  final Music music;

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              rowBuilder("Top Genres"),
              rowBuilderSongs("Top Songs", widget.music.topSongs),
            ],
          ),
        ),

        ReportSuggestion(),
      ],
    );
  }

  Widget rowBuilder(String title) {
    return Column(
      spacing: 8,
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
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.music.genres.length,
            separatorBuilder: (context, _) => SizedBox(width: 16),
            itemBuilder:
                (context, index) => CTCard(data: widget.music.genres[index]),
          ),
        ),
      ],
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
              widget.music.topSongs.map((song) {
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
                                song.singer,
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
}
