import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RegisterRequest {
  @JsonProperty(name: 'age')
  int? age;
  @JsonProperty(name: 'username')
  String? username;
  @JsonProperty(name: 'password')
  String? password;
}
