// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
  nationalDay: (json['nationalDay'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, DateTime.parse(e as String)),
  ),
  publicHolidays: (json['publicHolidays'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, DateTime.parse(e as String)),
  ),
  keyEvents: (json['keyEvents'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, DateTime.parse(e as String)),
  ),
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'nationalDay': instance.nationalDay.map(
    (k, e) => MapEntry(k, e.toIso8601String()),
  ),
  'publicHolidays': instance.publicHolidays.map(
    (k, e) => MapEntry(k, e.toIso8601String()),
  ),
  'keyEvents': instance.keyEvents.map(
    (k, e) => MapEntry(k, e.toIso8601String()),
  ),
};
