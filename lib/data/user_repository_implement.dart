import 'package:flutter_getx_base/data/local/user_local_data_source.dart';
import 'package:flutter_getx_base/data/remote/api/request/refresh_token_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/login_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/register_request.dart';
import 'package:flutter_getx_base/data/remote/user_remote_data_source.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/domain/repositories/user_repository.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource = UserRemoteDataSource();
  final UserLocalDataSource _localDataSource = UserLocalDataSource();

  @override
  Future<Pair<List<UserModel>?, int>> getUsers(int? page) {
    return _remoteDataSource.getUsers(page);
  }

  @override
  Future<void> saveUsername(String username) {
    return _localDataSource.saveUsername(username);
  }

  @override
  TokenModel? getToken() {
    return _localDataSource.getToken();
  }

  @override
  Future<void> saveToken(TokenModel? token) {
    return _localDataSource.saveToken(token);
  }

  @override
  Future<void> login(LoginRequest request) {
    return _remoteDataSource.login(request).then(
          (value) => saveToken(value),
        );
  }

  @override
  Future<TokenModel> refreshToken() {
    var currentToken = getToken()!;
    return _remoteDataSource
        .refreshToken(
            RefreshTokenRequest('refresh_token', currentToken.refreshToken))
        .then((token) {
      return saveToken(token).then((_) => token!);
    });
  }

  @override
  Future<void> register(RegisterRequest request) {
    return _remoteDataSource.register(request);
  }

  @override
  Future<List<BengKeiUserModel>> getBengUserList() {
    return _remoteDataSource.getBengkeiUserList();
  }

  @override
  void logout() {
    return _localDataSource.logout();
  }
}
