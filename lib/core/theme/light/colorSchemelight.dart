import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class colorschemelight {
  static ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: appcolors.primary,
    onPrimary: appcolors.onPrimary,
    secondary: appcolors.secondary,
    onSecondary: appcolors.onSecondary,
    error: appcolors.error,
    onError: Colors.white,
    surface: appcolors.surface,
    onSurface: appcolors.onSurface,
  );
}
