// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) =>
    Song(name: json['name'] as String, views: (json['views'] as num).toInt());

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
  'name': instance.name,
  'views': instance.views,
};
