import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class History {
  History({
    required this.nationalDay,
    required this.publicHolidays,
    required this.keyEvents,
  });

  DateTime nationalDay;
  Map<String, DateTime> publicHolidays;
  Map<String, DateTime> keyEvents;

  History.fromJson(Map<String, dynamic> json)
      : nationalDay = (json['nationalDay'] as Timestamp).toDate(),
        publicHolidays = {
          for (var key in json['publicHolidays'].keys)
            key: (json['publicHolidays'][key] as Timestamp).toDate()
        },
        keyEvents = {
          for (var key in json['keyEvents'].keys)
            key: (json['keyEvents'][key] as Timestamp).toDate()
        };
}
