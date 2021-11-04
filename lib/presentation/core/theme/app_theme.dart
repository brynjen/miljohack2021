import 'package:flutter/material.dart';

mixin AppColors {
  static Color get darkRed => const Color(0xFF980106);

  static Color get lightRed => const Color(0xFFfef7f1);

  static Color get greyBg => const Color(0xFFf2f2f2);
  static Color get white => const Color(0xFFFFFFFF);
}

mixin TS {
  static TextStyle get bold => const TextStyle(
      fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black);

  static TextStyle get body =>
      const TextStyle(fontSize: 12, color: Colors.black);

  static TextStyle get body2 =>
      const TextStyle(fontSize: 14, color: Colors.black);
}
