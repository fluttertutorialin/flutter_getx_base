import 'package:flutter/material.dart';
import 'package:flutter_getx_base/resources/colors/colors_manager.dart';
import 'package:get/get.dart';

class StylesManager {
  static StylesManager instance() => Get.find();

  TextStyle? _roboto13Regular;
  TextStyle? _roboto16Regular;

  TextStyle roboto13Regular() => _roboto13Regular ??= TextStyle(
        fontSize: 13,
        color: ColorsManager.instance().colorBlack(),
      );

  TextStyle roboto16Regular() => _roboto16Regular ??= TextStyle(
        fontSize: 16,
        color: ColorsManager.instance().colorBlack(),
      );
}
