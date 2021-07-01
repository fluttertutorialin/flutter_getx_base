import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/strings/localization_service.dart';
import 'package:flutter_getx_base/utils/config/app_binding.dart';
import 'package:flutter_getx_base/utils/config/app_config.dart';
import 'package:flutter_getx_base/utils/config/app_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required this.appConfig,
  });

  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(PixelRatio.initPRWidth, PixelRatio.initPRHeight),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        initialRoute: AppRoute.routeHomeScreen(),
        initialBinding: AppBinding(appConfig: appConfig),
        getPages: AppRoute.generateGetPages(),
      ),
    );
  }
}
