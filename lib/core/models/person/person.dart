import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_finance_management_app/core/enums/gender.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@Freezed()
class Person with _$Person {
  const Person._();

  @JsonSerializable(explicitToJson: true)
  const factory Person(
      {required int id,
      required String name,
      @Default(0) int age,
      Gender? gender}) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  String forTest() => name;
}
