import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class NameModel {
  @JsonProperty(name: 'title')
  String? title;

  @JsonProperty(name: 'first')
  String? first;

  @JsonProperty(name: 'last')
  String? last;
}
