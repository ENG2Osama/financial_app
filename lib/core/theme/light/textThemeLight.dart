import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class textthemelight {
  static TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: appcolors.textPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: appcolors.textSecondary,
    ),
  );
}
