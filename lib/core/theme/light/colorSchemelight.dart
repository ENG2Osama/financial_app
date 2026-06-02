import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class colorschemelight {
  static ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: appColors.primary,
    onPrimary: appColors.onPrimary,
    secondary: appColors.secondary,
    onSecondary: appColors.onSecondary,
    error: appColors.error,
    onError: Colors.white,
    surface: appColors.surface,
    onSurface: appColors.onSurface,
  );
}
