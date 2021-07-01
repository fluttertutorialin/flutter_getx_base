import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseErrorResponse {
  const BaseErrorResponse({this.status});

  @JsonProperty(name: 'status')
  final Status? status;
}

@jsonSerializable
class Status {
  const Status({
    this.message,
    this.statusCode,
  });

  @JsonProperty(name: 'message')
  final String? message;

  @JsonProperty(name: 'status')
  final int? statusCode;
}
