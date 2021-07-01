import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class PictureModel {
  @JsonProperty(name: 'large')
  String? large;

  @JsonProperty(name: 'medium')
  String? medium;

  @JsonProperty(name: 'thumbnail')
  String? thumbnail;
}
