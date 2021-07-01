import 'package:flutter_getx_base/data/remote/api/request/login_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/refresh_token_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/register_request.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';

abstract class UserRepository {
  Future<Pair<List<UserModel>?, int>> getUsers(int page);

  Future<void> saveUsername(String username);

  TokenModel? getToken();

  Future<void> saveToken(TokenModel token);

  Future<void> register(RegisterRequest request);

  Future<void> login(LoginRequest request);

  Future<TokenModel> refreshToken();

  Future<List<BengKeiUserModel>> getBengUserList();

  void logout();
}
