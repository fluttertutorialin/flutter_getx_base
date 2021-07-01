import 'package:flutter/material.dart';
import 'package:flutter_getx_base/data/remote/api/error/network_exception.dart';
import 'package:flutter_getx_base/domain/base/process_state.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_observer.dart';
import 'package:flutter_getx_base/domain/usecases/login_use_case.dart';
import 'package:flutter_getx_base/presentation/base_controller.dart';
import 'package:flutter_getx_base/utils/config/app_route.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginUseCase(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}

class LoginController extends BaseController {
  LoginController(this.loginUseCase);

  final usernameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final LoginUseCase loginUseCase;
  final loginState = ProcessState();

  void onLogin() {
    loginUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          loginState.onLoading();
        },
        onSuccess: (_) {
          loginState.onSuccess();
          Get.offAllNamed(AppRoute.routeRefreshTokenScreen());
        },
        onError: (NetWorkException e) {
          loginState.onError(e.toString());
        },
      ),
      input: LoginInput(
        usernameTextEditingController.text,
        passwordTextEditingController.text,
      ),
    );
  }

  @override
  void dispose() {
    usernameTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }
}
