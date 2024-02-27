
  import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes_manager.dart';

// double setwidth(double w) {
//     return ScreenUtil().setWidth(w);
//   }

//   double setheight(double h) {
//     return ScreenUtil().setHeight(h);
//   }
void login_func(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.loginRoute);
}

void tohome(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.homeRoute);
}

void signup_func(BuildContext context) {
  Navigator.pushReplacementNamed(context, Routes.signup);
}

class AppMargin {
  static const double m8 = 8.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
}

class AppPadding {
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
}

class AppSize {
  static const double s0 = 0;
  static const double s1_5 = 1.5;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s40 = 40.0;
  static const double s60 = 60.0;
  static const double s100 = 100.0;
}
