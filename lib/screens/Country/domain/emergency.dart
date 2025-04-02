import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Emergency{
  Emergency(
      this.police,
      this.ambulance,
      this.fire,
      );

  String  police ;
  String  ambulance ;
  String  fire ;

}