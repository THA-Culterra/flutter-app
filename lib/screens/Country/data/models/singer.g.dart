// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Singer _$SingerFromJson(Map<String, dynamic> json) => Singer(
  name: json['name'] as String,
  age: (json['age'] as num).toInt(),
  songs:
      (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SingerToJson(Singer instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
  'songs': instance.songs,
};
