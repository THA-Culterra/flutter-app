// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) =>
    Review(authorId: json['authorId'] as String, text: json['text'] as String);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'authorId': instance.authorId,
  'text': instance.text,
};
