import 'package:json_annotation/json_annotation.dart';

part 'taxi_app.g.dart';
@JsonSerializable()
class TaxiApp {
  String name;
  String imageUrl;

  TaxiApp({
    required this.name,
    required this.imageUrl,
  });

  factory TaxiApp.fromJson(Map<String, dynamic> json) => _$TaxiAppFromJson(json);
  Map<String, dynamic> toJson() => _$TaxiAppToJson(this);
}