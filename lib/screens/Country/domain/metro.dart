import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Metro{
  Metro(
      this.city,
      this.image,
      );

  String  city ;
  String  image ;
}
