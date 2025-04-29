// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuisine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cuisine _$CuisineFromJson(Map<String, dynamic> json) => Cuisine(
  dishes:
      (json['dishes'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
  restaurants:
      (json['restaurants'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CuisineToJson(Cuisine instance) => <String, dynamic>{
  'dishes': instance.dishes,
  'restaurants': instance.restaurants,
};
