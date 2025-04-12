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
      : nationalDay = DateTime.parse(json['nationalDay']),
        publicHolidays = (json['publicHolidays'] as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, DateTime.parse(value))),
        keyEvents = (json['keyEvents'] as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, DateTime.parse(value)));
}
