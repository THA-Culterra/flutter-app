// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Athlete _$AthleteFromJson(Map<String, dynamic> json) => Athlete(
  name: json['name'] as String,
  age: (json['age'] as num).toInt(),
  sportName: json['sportName'] as String,
);

Map<String, dynamic> _$AthleteToJson(Athlete instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
  'sportName': instance.sportName,
};
