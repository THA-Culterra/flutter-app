// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
  name: json['name'] as String,
  views: (json['views'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  singer: json['singer'] as String,
  youtubeUrl: json['youtubeUrl'] as String,
);

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
  'name': instance.name,
  'views': instance.views,
  'imageUrl': instance.imageUrl,
  'singer': instance.singer,
  'youtubeUrl': instance.youtubeUrl,
};
