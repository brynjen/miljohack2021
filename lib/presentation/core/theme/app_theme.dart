import 'package:flutter/material.dart';

mixin AppColors {
  static Color get white => const Color(0xFFFFFFFF);

  static Color get black => const Color(0xFF000000);

  static MaterialColor get red => const MaterialColor(0xFFE32D22, {
        200: Color(0xFFFEF7F1),
        300: Color(0xFFFF8A5F),
        500: Color(0xFFE32D22),
        600: Color(0xFF980000),
        700: Color(0xFF980106),
      });

  static MaterialColor get grey => const MaterialColor(0xFF000000, {
        100: Color(0xFFFFF5F0),
        200: Color(0xFFf2f2f2),
        300: Color(0xCCFFFFFF),
        400: Color(0x77FFFFFF),
        500: Color(0x77CCCCCC),
        600: Color(0x773E4454),
        700: Color(0x20000000),
        800: Color(0x40000000),
        900: Color(0x80000000),
      });
}

mixin AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        backgroundColor: AppColors.grey[200],
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(AppColors.red[500]!),
          trackColor: MaterialStateProperty.all<Color>(AppColors.red[300]!),
        ),
        appBarTheme: AppBarTheme(color: AppColors.red[500]),
        tabBarTheme: TabBarTheme(labelColor: AppColors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.grey[200],
            selectedItemColor: AppColors.red[500],
            unselectedItemColor: AppColors.grey[900]),
        cardTheme: CardTheme(color: AppColors.white),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: AppColors.red[500],
              background: AppColors.grey[200],
              onPrimary: AppColors.white, // Text on AppBar
            ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        backgroundColor: AppColors.black,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(AppColors.red[500]!),
          trackColor: MaterialStateProperty.all<Color>(AppColors.red[300]!),
        ),
        cardTheme: CardTheme(color: AppColors.grey[600]),
        appBarTheme: AppBarTheme(color: AppColors.black),
        tabBarTheme: TabBarTheme(labelColor: AppColors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.black,
            selectedItemColor: AppColors.red[500],
            unselectedItemColor: AppColors.grey[500]),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: AppColors.black,
              background: AppColors.grey[800],
              onPrimary: AppColors.white, // Text on AppBar
            ),
      );
}

class TS {
  factory TS(BuildContext context) {
    _instance = TS._constructor(context);
    return _instance;
  }

  static late TS _instance;
  BuildContext context;

  TS._constructor(this.context);

  static TS of(BuildContext context) => TS._constructor(context);

  TextStyle get bold => TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w900,
      color: context.isLight ? Colors.black : Colors.white);

  TextStyle get header => TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: context.isLight ? Colors.black : Colors.white);

  TextStyle get body => TextStyle(
      fontSize: 16, color: context.isLight ? Colors.black : Colors.white);

  TextStyle get body2 => TextStyle(
      fontSize: 14, color: context.isLight ? Colors.black : Colors.white);

  TextStyle get subtitle => TextStyle(
      fontSize: 18, color: context.isLight ? Colors.black : Colors.white);

  TextStyle get fatSubTitle => TextStyle(
      fontSize: 18,
      color: context.isLight ? Colors.black : Colors.white,
      fontWeight: FontWeight.w500);

  TextStyle get link => TextStyle(
      fontSize: 18,
      color: context.isLight ? Colors.black : Colors.white,
      decoration: TextDecoration.underline);
}

extension BrightnessThemeExtension on BuildContext {
  /// You are currently viewing in dark mode
  bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;

  /// You are currently viewing in light mode
  bool get isLight =>
      MediaQuery.of(this).platformBrightness == Brightness.light;
}
