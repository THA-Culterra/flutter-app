// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) => Music(
  genres:
      (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
  topSongs:
      (json['topSongs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
  notableSingers:
      (json['notableSingers'] as List<dynamic>)
          .map((e) => Singer.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
  'genres': instance.genres,
  'topSongs': instance.topSongs,
  'notableSingers': instance.notableSingers,
};
