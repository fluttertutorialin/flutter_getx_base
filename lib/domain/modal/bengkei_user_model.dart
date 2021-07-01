import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BengKeiUserModel {
  @JsonProperty(name: 'username')
  String? userName;

  @JsonProperty(name: 'age')
  int? age;
}
