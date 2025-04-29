import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';
@JsonSerializable()
class History{
  History({
    required this.nationalDay,
    required this.publicHolidays,
    required this.keyEvents,
  });

  Map<String, DateTime> nationalDay;
  Map<String, DateTime> publicHolidays;
  Map<String, DateTime> keyEvents;

  // A factory constructor to create a Cuisine object from JSON
  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
