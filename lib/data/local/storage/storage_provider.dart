import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:get_storage/get_storage.dart';

class StorageProvider {
  final GetStorage _getStorage = GetStorage();

  String? getUsername() => _getStorage.read(StorageKey.keyUser);

  Future<void> saveUsername(String username) =>
      _getStorage.write(StorageKey.keyUser, username);

  TokenModel? getToken() =>
      JsonMapper.fromJson<TokenModel>(_getStorage.read(StorageKey.keyToken));

  Future<void> saveToken(TokenModel? token) =>
      _getStorage.write(StorageKey.keyToken, JsonMapper.toJson(token));

  Future<void> clearToken() => _getStorage.remove(StorageKey.keyToken);

  void addTokenListener(Function(TokenModel?) listener) => _getStorage.listenKey(
      StorageKey.keyToken,
      (token) => listener.call(JsonMapper.fromJson<TokenModel>(token)));
}

class StorageKey {
  static final String keyUser = 'user_information';
  static final String keyToken = 'user_token';
}
