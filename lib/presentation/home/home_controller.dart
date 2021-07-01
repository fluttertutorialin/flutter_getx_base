import 'package:flutter_getx_base/domain/usecases/logout_use_case.dart';
import 'package:flutter_getx_base/presentation/base_controller.dart';
import 'package:flutter_getx_base/utils/config/app_route.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoutUseCase(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}

class HomeController extends BaseController {
  HomeController(this._logoutUseCase);

  final LogoutUseCase _logoutUseCase;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void goToLoadMoreScreen() {
    Get.toNamed(AppRoute.routeLoadmoreScreen());
  }

  void goToRefreshTokenScreen() {
    Get.toNamed(AppRoute.routeRefreshTokenScreen());
  }

  void goToAnimationScreen() {
    Get.toNamed(AppRoute.routeAnimationScreen());
  }

  void onLogout() {
    _logoutUseCase.execute();
  }
}
