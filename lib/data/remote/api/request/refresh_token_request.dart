import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RefreshTokenRequest {
  RefreshTokenRequest(this.grantTpe, this.refreshToken);

  @JsonProperty(name: 'grant_type')
  String grantTpe;
  @JsonProperty(name: 'refresh_token')
  String? refreshToken;
}
