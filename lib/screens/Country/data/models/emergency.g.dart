// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emergency _$EmergencyFromJson(Map<String, dynamic> json) => Emergency(
  police: (json['police'] as num).toInt(),
  ambulance: (json['ambulance'] as num).toInt(),
  fire: (json['fire'] as num).toInt(),
);

Map<String, dynamic> _$EmergencyToJson(Emergency instance) => <String, dynamic>{
  'police': instance.police,
  'ambulance': instance.ambulance,
  'fire': instance.fire,
};
