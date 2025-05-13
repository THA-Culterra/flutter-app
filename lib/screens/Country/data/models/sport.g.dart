// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sport _$SportFromJson(Map<String, dynamic> json) => Sport(
  name: json['name'] as String,
  nationalTeamYear: (json['nationalTeamYear'] as num).toInt(),
  trophies:
      (json['trophies'] as List<dynamic>)
          .map((e) => Trophy.fromJson(e as Map<String, dynamic>))
          .toList(),
  teamLogo: json['teamLogo'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$SportToJson(Sport instance) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'name': instance.name,
  'nationalTeamYear': instance.nationalTeamYear,
  'trophies': instance.trophies,
  'teamLogo': instance.teamLogo,
};
