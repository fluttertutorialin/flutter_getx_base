import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';

@jsonSerializable
@Json(valueDecorators: BaseResponse.valueDecorators)
class BaseResponse<T> {
  static Map<Type, ValueDecoratorFunction> valueDecorators() => {
        typeOf<BaseResponse<List<UserModel>>>(): (value) =>
            BaseResponse<List<UserModel>>.of(value)
      };

  const BaseResponse({this.data, this.metaData});

  @JsonProperty(name: 'results')
  final T? data;

  @JsonProperty(name: 'meta_data')
  final MetaData? metaData;

  factory BaseResponse.of(BaseResponse<dynamic> other) => BaseResponse<T>(
        data: other.data,
        metaData: other.metaData,
      );
}

@jsonSerializable
class MetaData {
  const MetaData({this.page});

  @JsonProperty(name: 'page')
  final int? page;
}
