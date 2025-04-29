// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  description: json['description'] as String,
  capital: json['capital'] as String,
  majorCities:
      (json['majorCities'] as List<dynamic>).map((e) => e as String).toList(),
  languages:
      (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
  currency: json['currency'] as String,
  religion: $enumDecode(_$ReligionEnumMap, json['religion']),
  dialCode: json['dialCode'] as String,
  cuisine: Cuisine.fromJson(json['cuisine'] as Map<String, dynamic>),
  music: Music.fromJson(json['music'] as Map<String, dynamic>),
  cinema: Cinema.fromJson(json['cinema'] as Map<String, dynamic>),
  history: History.fromJson(json['history'] as Map<String, dynamic>),
  athletics: Athletics.fromJson(json['athletics'] as Map<String, dynamic>),
  transport: Transport.fromJson(json['transport'] as Map<String, dynamic>),
  emergency: Emergency.fromJson(json['emergency'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'description': instance.description,
  'capital': instance.capital,
  'majorCities': instance.majorCities,
  'languages': instance.languages,
  'currency': instance.currency,
  'religion': _$ReligionEnumMap[instance.religion]!,
  'dialCode': instance.dialCode,
  'cuisine': instance.cuisine,
  'music': instance.music,
  'cinema': instance.cinema,
  'history': instance.history,
  'athletics': instance.athletics,
  'transport': instance.transport,
  'emergency': instance.emergency,
};

const _$ReligionEnumMap = {
  Religion.islam: 'islam',
  Religion.christianity: 'christianity',
  Religion.judaism: 'judaism',
  Religion.hinduism: 'hinduism',
};
