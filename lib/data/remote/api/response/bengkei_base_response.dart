import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';

@jsonSerializable
@Json(valueDecorators: BengKeiBaseResponse.valueDecorators)
class BengKeiBaseResponse<T> {
  static Map<Type, ValueDecoratorFunction> valueDecorators() => {
        typeOf<BengKeiBaseResponse<List<BengKeiUserModel>>>(): (value) =>
            BengKeiBaseResponse<List<BengKeiUserModel>>.of(value)
      };

  const BengKeiBaseResponse({this.data, this.diagnostic});

  @JsonProperty(name: 'users')
  final T? data;

  @JsonProperty(name: 'diagnostic')
  final Diagnostic? diagnostic;

  factory BengKeiBaseResponse.of(BengKeiBaseResponse<dynamic> other) =>
      BengKeiBaseResponse<T>(
        data: other.data,
        diagnostic: other.diagnostic,
      );
}

@jsonSerializable
class Diagnostic {
  @JsonProperty(name: 'status')
  int? status;

  @JsonProperty(name: 'message')
  String? message;

  @JsonProperty(name: 'unix_timestamp')
  int? unixTimestamp;
}
