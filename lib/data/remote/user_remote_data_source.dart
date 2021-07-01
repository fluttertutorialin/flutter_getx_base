import 'package:flutter_getx_base/data/remote/api/beng_kei_api_provider.dart';
import 'package:flutter_getx_base/data/remote/api/random_user_api_provider.dart';
import 'package:flutter_getx_base/data/remote/api/refresh_token_api_provider.dart';
import 'package:flutter_getx_base/data/remote/api/request/login_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/refresh_token_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/register_request.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';
import 'package:get/get.dart';

class UserRemoteDataSource {
  final RandomUserApiProvider _andomeUserApiProvider = Get.find();
  final BengKeiApiProvider _bengKeiApiProvider = Get.find();
  final RefreshTokenApiProvider _refreshTokenApiProvider = Get.find();

  Future<Pair<List<UserModel>?, int>> getUsers(int? page) {
    return _andomeUserApiProvider.getUser(page);
  }

  Future<void> register(RegisterRequest request) {
    return _bengKeiApiProvider.registerUser(request);
  }

  Future<TokenModel?> login(LoginRequest request) {
    return _bengKeiApiProvider.login(request);
  }

  Future<TokenModel?> refreshToken(RefreshTokenRequest request) {
    return _refreshTokenApiProvider.refreshToken(request);
  }

  Future<List<BengKeiUserModel>> getBengkeiUserList() {
    return _bengKeiApiProvider.getListUser();
  }
}
