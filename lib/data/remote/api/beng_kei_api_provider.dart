import 'dart:async';
import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/data/remote/api/base_provider.dart';
import 'package:flutter_getx_base/data/remote/api/request/login_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/register_request.dart';
import 'package:flutter_getx_base/data/remote/api/response/bengkei_base_response.dart';
import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:flutter_getx_base/utils/service/auth_service.dart';
import 'package:get/get.dart';

class BengKeiApiProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.baseUrl = "http://bengkelrobot.net:8002";
    httpClient.timeout = Duration(seconds: 15);
    httpClient.maxAuthRetries = 3;

    httpClient.addAuthenticator<dynamic>((request) async {
      var newToken;
      try {
        newToken = await Get.find<UserRepositoryImpl>().refreshToken();
      } catch (_) {
        newToken = Get.find<AuthService>().tokenModel;
      }
      request.headers['Authorization'] = 'Bearer ${newToken.accessToken}';
      return request;
    });

    httpClient.addRequestModifier<dynamic>((request) async {
      var authService = Get.find<AuthService>();
      if (authService.tokenModel != null) {
        request.headers['Authorization'] =
            'Bearer ${authService.tokenModel!.accessToken}';
      } else {
        request.headers['Authorization'] = 'Basic ' +
            base64Encode(
                utf8.encode('bengkel-robot-client:bengkel-robot-secret'));
      }
      return request;
    });
  }

  Future<void> registerUser(RegisterRequest request) {
    return postDeserialize(
      '/register/user',
      JsonMapper.toJson(request),
    );
  }

  Future<TokenModel?> login(LoginRequest request) {
    return postDeserialize<TokenModel>(
      '/oauth/token',
      FormData(
        JsonMapper.toMap(request)!,
      ),
    );
  }

  Future<List<BengKeiUserModel>> getListUser() {
    return getDeserialize<BengKeiBaseResponse<List<BengKeiUserModel>>>(
      '/users/user',
    ).then((value) => value!.data!);
  }
}
