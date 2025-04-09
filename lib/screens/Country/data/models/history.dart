import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class History{
  History({
    required this.nationalDay,
    required this.publicHolidays,
    required this.keyEvents,
  });

  DateTime nationalDay ;
  Map<String, DateTime> publicHolidays;
  Map<String, DateTime> keyEvents;
}
