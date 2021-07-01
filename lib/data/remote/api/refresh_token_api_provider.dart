import 'dart:async';
import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/data/remote/api/base_provider.dart';
import 'package:flutter_getx_base/data/remote/api/request/refresh_token_request.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:get/get.dart';

class RefreshTokenApiProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.baseUrl = "http://bengkelrobot.net:8002";
    httpClient.timeout = Duration(seconds: 15);

    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers['Authorization'] = 'Basic ' +
          base64Encode(
              utf8.encode('bengkel-robot-client:bengkel-robot-secret'));
      return request;
    });
  }

  Future<TokenModel?> refreshToken(RefreshTokenRequest request) {
    return postDeserialize<TokenModel>(
      '/oauth/token',
      FormData(
        JsonMapper.toMap(request)!,
      ),
    );
  }
}
