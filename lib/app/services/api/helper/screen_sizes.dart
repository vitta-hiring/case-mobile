import 'package:flutter/material.dart';

class ScreenSizes {
  static MediaQueryData mediaQuery;
  static double _width;
  static double _height;
  static double _topbarH;
  static double _botbarH;
  static double _pixelRatio;
  static var _ratio;
  static initContext(BuildContext context) {
    if (mediaQuery == null) {
      mediaQuery = MediaQuery.of(context);
      _width = mediaQuery.size.width;
      _height = mediaQuery.size.height;
      _topbarH = mediaQuery.padding.top;
      _botbarH = mediaQuery.padding.bottom;
      _pixelRatio = mediaQuery.devicePixelRatio;
    }
  }

  static init(int number) {
    int uiwidth = number is int ? number : 650;
    _ratio = _width / uiwidth;
  }

  static px(number) {
    if (!(_ratio is double || _ratio is int)) {
      ScreenSizes.init(650);
    }
    return number * _ratio;
  }

  static onepx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topbarH;
  }

  static padBotH() {
    return _botbarH;
  }
}
