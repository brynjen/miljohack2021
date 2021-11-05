import 'package:flutter/material.dart';

mixin AppColors {
  static Color get greyBg => const Color(0xFFf2f2f2);

  static Color get white => const Color(0xFFFFFFFF);

  static MaterialColor get red => const MaterialColor(0xFFE32D22, {
        200: Color(0xFFFEF7F1),
        300: Color(0xFFFF8A5F),
        500: Color(0xFFE32D22),
        600: Color(0xFF980000),
        700: Color(0xFF980106),
      });

  static MaterialColor get grey => const MaterialColor(0xFF000000, {
        200: Color(0xFFFFF5F0),
        300: Color(0x40000000),
        500: Color(0x80000000),
        900: Color(0xD9000000),
      });

/*s*/
}

mixin AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(AppColors.red[500]!),
          trackColor: MaterialStateProperty.all<Color>(AppColors.red[300]!),
        ),
        cardTheme: CardTheme(color: AppColors.white),
        colorScheme: ThemeData.light()
            .colorScheme
            .copyWith(primary: Colors.red, background: AppColors.greyBg),
      );

  static ThemeData get dark => ThemeData.light().copyWith(
        colorScheme: ThemeData.light()
            .colorScheme
            .copyWith(primary: Colors.red, background: AppColors.greyBg),
      );
}

mixin TS {
  static TextStyle get bold => const TextStyle(
      fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black);

  static TextStyle get body =>
      const TextStyle(fontSize: 16, color: Colors.black);

  static TextStyle get body2 =>
      const TextStyle(fontSize: 14, color: Colors.black);

  static TextStyle get subtitle =>
      const TextStyle(fontSize: 18, color: Colors.black);

  static TextStyle get fatSubTitle => const TextStyle(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500);

  static TextStyle get link => const TextStyle(
      fontSize: 18, color: Colors.black, decoration: TextDecoration.underline);
}
