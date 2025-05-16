import 'package:json_annotation/json_annotation.dart';

import '../Country/data/models/CulterraUser.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String authorId;
  final String text;

  Review({
    required this.authorId,
    required this.text
  });

  // A factory constructor to create a Cuisine object from JSON
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  // A method to convert a Cuisine object into JSON
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}