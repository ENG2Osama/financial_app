import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/colorSchemelight.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:flutter/material.dart';

class appTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: textthemelight.textTheme,
    colorScheme: colorschemelight.colorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(double.infinity, 56),
        minimumSize: Size(163, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(appSizes.borderRadius),
          ),
        ),
        backgroundColor: appColors.primary,
        foregroundColor: appColors.secondary,
      ),
    ),
    scaffoldBackgroundColor: appColors.background,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,shadowColor:appColors.shadow,
      backgroundColor: appColors.bgLight,

    )
  );
}
