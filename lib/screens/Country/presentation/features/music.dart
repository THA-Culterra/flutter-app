import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Widgets/ct_card.dart';
import '../../../Widgets/report_suggestion.dart';
import '../../data/models/music.dart';
import '../../data/models/song.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key, required this.music});

  final Music music;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              rowBuilder("Top Genres"),
              rowBuilderSongs("Top Songs", music.topSongs)
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
            itemCount: music.genres.length,
            separatorBuilder: (context, _) => SizedBox(width: 16),
            itemBuilder: (context, index) => CTCard(data: music.genres[index]),
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
              songs.map((song) {
                final videoId = YoutubePlayer.convertUrlToId(song.youtubeUrl);
                if (videoId != null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoId,
                        flags: YoutubePlayerFlags(autoPlay: false, mute: false),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                    ),
                  );
                } else {
                  return ListTile(
                    title: Text(song.name),
                    trailing: Icon(Icons.link),
                    onTap: () => _launchURL(song.youtubeUrl),
                  );
                }
              }).toList(),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
