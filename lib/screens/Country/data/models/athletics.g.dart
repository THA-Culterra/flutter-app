// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athletics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Athletics _$AthleticsFromJson(Map<String, dynamic> json) => Athletics(
  popularSports:
      (json['popularSports'] as List<dynamic>)
          .map((e) => Sport.fromJson(e as Map<String, dynamic>))
          .toList(),
  athletes:
      (json['athletes'] as List<dynamic>)
          .map((e) => Athlete.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AthleticsToJson(Athletics instance) => <String, dynamic>{
  'popularSports': instance.popularSports,
  'athletes': instance.athletes,
};
