import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsManager {
  static ColorsManager instance() => Get.find();

  Color? _colorBlack;
  Color? _colorRed;

  Color colorBlack() => _colorBlack ??= Color(0xFF000000);
  Color colorRed() => _colorRed ??= Color(0xFFB71C1C);
}
