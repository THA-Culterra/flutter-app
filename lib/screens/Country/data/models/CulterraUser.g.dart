// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CulterraUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CulterraUser _$CulterraUserFromJson(Map<String, dynamic> json) => CulterraUser(
  uid: json['uid'] as String,
  email: json['email'] as String?,
  displayName: json['displayName'] as String?,
  photoURL: json['photoURL'] as String?,
  phone: json['phone'] as String?,
  nationality: json['nationality'] as String,
  role: $enumDecode(_$RoleEnumMap, json['role']),
);

Map<String, dynamic> _$CulterraUserToJson(CulterraUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'phone': instance.phone,
      'nationality': instance.nationality,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.explorer: 'explorer',
  Role.cuisine: 'cuisine',
  Role.music: 'music',
  Role.cinema: 'cinema',
  Role.history: 'history',
  Role.sports: 'sports',
  Role.transport: 'transport',
  Role.emergency: 'emergency',
};
