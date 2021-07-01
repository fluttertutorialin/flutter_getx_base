import 'package:flutter_screenutil/flutter_screenutil.dart';

class PixelRatio {
  static const double initPRWidth = 375;
  static const double initPRHeight = 812;

  static const double dp10 = 10;
  static const double dp20 = 20;
  static const double dp30 = 30;
  static const double dp40 = 40;
  static const double dp50 = 50;
  static const double dp375 = 375;

  // text size
  static const double sp10 = 10;
  static const double sp11 = 11;
  static const double sp13 = 13;
  static const double sp16 = 16;
  static const double sp18 = 18;
  static const double sp20 = 20;
}

double fixed(double width) => width.w;

double scaleHeight(double height) => height.h;

double scaleWidth(double width) => width.w;

double sp(double size) => size.sp;

double screenWidth() => ScreenUtil().screenWidth;

double screenHeiht() => ScreenUtil().scaleHeight;
