// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Person _$$_PersonFromJson(Map<String, dynamic> json) => _$_Person(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int? ?? 0,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
