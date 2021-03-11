import 'package:flutter_getx_base/data/remote/api/base_provider.dart';
import 'package:flutter_getx_base/data/remote/api/response/base_response.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';

class RandomUserApiProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://randomuser.me";
    httpClient.timeout = Duration(seconds: 15);
    httpClient.errorSafety = false;
    httpClient.addRequestModifier((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });
    httpClient.addAuthenticator((request) async {
      final token = "abcxyz";
      // Set the header
      request.headers['Authorization'] = "$token";
      return request;
    });
  }

  Future<Pair<List<UserModel>, int>> getUser(int page) async {
    return getDeserialize<BaseResponse<List<UserModel>>>(
            '/api/?page=$page&results=10')
        .then((value) => Pair(value.data, page + 1));
  }
}
