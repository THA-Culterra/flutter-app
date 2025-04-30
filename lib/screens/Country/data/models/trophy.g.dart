// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trophy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trophy _$TrophyFromJson(Map<String, dynamic> json) =>
    Trophy(name: json['name'] as String, count: (json['count'] as num).toInt());

Map<String, dynamic> _$TrophyToJson(Trophy instance) => <String, dynamic>{
  'name': instance.name,
  'count': instance.count,
};
