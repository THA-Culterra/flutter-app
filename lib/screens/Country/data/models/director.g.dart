// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Director _$DirectorFromJson(Map<String, dynamic> json) =>
    Director(name: json['name'] as String, age: (json['age'] as num).toInt());

Map<String, dynamic> _$DirectorToJson(Director instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
};
