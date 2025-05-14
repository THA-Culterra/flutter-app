// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transport _$TransportFromJson(Map<String, dynamic> json) => Transport(
  airports:
      (json['airports'] as List<dynamic>)
          .map((e) => Airport.fromJson(e as Map<String, dynamic>))
          .toList(),
  drivingSide: $enumDecode(_$DrivingSideEnumMap, json['drivingSide']),
  taxiApps:
      (json['taxiApps'] as List<dynamic>)
          .map((e) => TaxiApp.fromJson(e as Map<String, dynamic>))
          .toList(),
  metroSystems:
      (json['metroSystems'] as List<dynamic>)
          .map((e) => Metro.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$TransportToJson(Transport instance) => <String, dynamic>{
  'airports': instance.airports,
  'drivingSide': _$DrivingSideEnumMap[instance.drivingSide]!,
  'taxiApps': instance.taxiApps,
  'metroSystems': instance.metroSystems,
};

const _$DrivingSideEnumMap = {
  DrivingSide.left: 'left',
  DrivingSide.right: 'right',
};
