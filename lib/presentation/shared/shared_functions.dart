import 'package:flutter/cupertino.dart';

class Dimension {
  Dimension() {}
  static double ScreenWidth(BuildContext c) => MediaQuery.of(c).size.width;
  static double ScreenHeight(BuildContext c) => MediaQuery.of(c).size.height;
}

int TdToInt(String tdName) {
  switch (tdName) {
    case 'cpi1':
      return 1;
      break;
    case 'cpi2':
      return 2;
      break;
    case 'l1info':
      return 3;
      break;

    default:
      print('Invalid grade.');
      break;
  }
  return 0;
}
