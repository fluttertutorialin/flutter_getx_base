import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_base/presentation/animation/animations_controller.dart';
import 'package:flutter_getx_base/presentation/animation/animations_screen.dart';
import 'package:flutter_getx_base/utils/service/auth_service.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/presentation/home/home_screen.dart';
import 'package:flutter_getx_base/presentation/loadmoreuser/loadmore_user_controller.dart';
import 'package:flutter_getx_base/presentation/loadmoreuser/loadmore_user_screen.dart';
import 'package:flutter_getx_base/presentation/login/login_controller.dart';
import 'package:flutter_getx_base/presentation/login/login_screen.dart';
import 'package:flutter_getx_base/presentation/refreshtoken/refresh_token_controller.dart';
import 'package:flutter_getx_base/presentation/refreshtoken/refresh_token_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static String routeHomeScreen() => '/';
  static String routeLoginScreen() => '/login';
  static String routeRegisterScreen() => '/register';
  static String routeSearchScreen() => '/search';
  static String routeLoadmoreScreen() => '/loadmore';
  static String routeRefreshTokenScreen() => '/refresh_token';
  static String routeAnimationScreen() => '/animation';

  static List<GetPage> generateGetPages() => [
        GetPage(
          name: routeHomeScreen(),
          page: () => HomeScreen(),
          binding: HomeBinding(),
          transition: Transition.cupertino,
          children: [
            GetPage(
              transition: Transition.cupertino,
              name: routeSearchScreen(),
              page: () => Container(),
            ),
          ],
        ),
        GetPage(
          name: routeLoginScreen(),
          page: () => LoginScreen(),
          binding: LoginBinding(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: routeLoadmoreScreen(),
          page: () => LoadmoreScreen(),
          binding: LoadmoreBinding(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: routeRefreshTokenScreen(),
          page: () => RefreshTokenScreen(),
          binding: RefreshTokenBinding(),
          middlewares: [AuthenMiddleware()],
          transition: Transition.cupertino,
        ),
        GetPage(
          name: routeAnimationScreen(),
          page: () => AnimationsScreen(),
          binding: AnimationsBinding(),
          transition: Transition.cupertino,
        ),
      ];
}

class AuthenMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route, {Object? arguments}) {
    var isLogged = Get.find<AuthService>().hasLogin();
    return isLogged
        ? null
        : RouteSettings(
            name: AppRoute.routeLoginScreen(), arguments: arguments);
  }
}
