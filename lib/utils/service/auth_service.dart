import 'package:flutter_getx_base/data/local/storage/storage_provider.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:flutter_getx_base/utils/config/app_route.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  StorageProvider _storageProvider = Get.find();
  TokenModel? tokenModel;

  @override
  void onInit() {
    super.onInit();
    tokenModel = _storageProvider.getToken();

    _storageProvider.addTokenListener((TokenModel? token) {
      if (token == null) {
        Get.offAllNamed(AppRoute.routeLoginScreen());
      }
      tokenModel = token;
    });
  }

  bool hasLogin() => tokenModel != null;
}
