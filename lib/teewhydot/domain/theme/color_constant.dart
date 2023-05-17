import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray90014 = fromHex('#14391400');

  static Color deepOrange50 = fromHex('#f9e5da');

  static Color gray400 = fromHex('#b3b3b3');

  static Color whiteA7004b = fromHex('#4bffffff');

  static Color blueGray100 = fromHex('#d7d7d7');

  static Color gray90077 = fromHex('#775b2000');

  static Color whiteA700A3 = fromHex('#a3ffffff');

  static Color gray900 = fromHex('#381300');

  static Color deepOrange40001 = fromHex('#ef6c57');

  static Color blueGray80001 = fromHex('#3a3c56');

  static Color red50 = fromHex('#fdf0e9');

  static Color gray900A3 = fromHex('#a3391400');

  static Color gray9000a = fromHex('#0a391400');

  static Color blueGray800 = fromHex('#3a3b55');

  static Color scaffoldColorOne = fromHex('#28293e');

  static Color deepOrange400 = fromHex('#ef6d58');

  static Color whiteA700 = fromHex('#ffffff');

  static Color deepOrange100 = fromHex('#f3d1bf');

  static Color deepBlue50 = fromHex('#003366');

  static Color darkBlue = fromHex('#0059b3');

  static Color mediumBlue = fromHex('#0077b3');
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
