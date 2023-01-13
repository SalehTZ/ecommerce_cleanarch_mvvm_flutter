import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#ed9728');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9e9e9e');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ed9728');

  static Color darkPrimary = HexColor.fromHex('#d17d11');
  static Color grey1 = HexColor.fromHex('#707070');
  static Color grey2 = HexColor.fromHex('#797979');
  static Color white = HexColor.fromHex('#ffffff');
  static Color error = HexColor.fromHex('#e61f34');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    // to check if it has opacity
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
