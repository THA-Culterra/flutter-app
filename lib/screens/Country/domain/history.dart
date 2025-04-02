import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class History{
  History(
      this.nationalDay,
      this.publicHolidays,
      this.keyEvents,
      );

  DateTime nationalDay ;
  List<DateTime>  publicHolidays ;
  List<DateTime>  keyEvents ;

}
