import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/CTCardData.dart';

@JsonSerializable()
class Genre implements CTCardData {
  Genre({
    required this.name,
    required this.imageUrl,
  });

  @override
  String  name ;

  @override
  String  imageUrl ;

  }