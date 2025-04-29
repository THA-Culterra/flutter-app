// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) =>
    Actor(name: json['name'] as String, age: (json['age'] as num).toInt());

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
};
