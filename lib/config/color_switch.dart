import 'dart:ui';

import 'package:mobile_checklist/utils/variables.dart';

class ColorSwitch {
  static final _colorSwitch = ColorSwitch._internal();
  Color currentColor1 =
      Color.fromRGBO(235, 143, 143, 1.0); // Initialize with red color
  Color currentColor2 =
      Color.fromRGBO(143, 235, 143, 1.0); // Initialize with green color

  factory ColorSwitch() {
    return _colorSwitch;
  }

  ColorSwitch._internal();

  void updateColor(RGBColor rgbColor, int colorIndex) {
    if (colorIndex == 1) {
      currentColor1 =
          Color.fromRGBO(rgbColor.red, rgbColor.green, rgbColor.blue, 1.0);
    } else if (colorIndex == 2) {
      currentColor2 =
          Color.fromRGBO(rgbColor.red, rgbColor.green, rgbColor.blue, 1.0);
    }
  }
}

final colorSwitch = ColorSwitch();
