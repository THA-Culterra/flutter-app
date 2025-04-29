// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
  name: json['name'] as String,
  description: json['description'] as String,
  mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'mealType': _$MealTypeEnumMap[instance.mealType]!,
  'imageUrl': instance.imageUrl,
};

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.dessert: 'dessert',
};
