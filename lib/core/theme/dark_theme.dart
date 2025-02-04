import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_theme.dart';

// Dark theme properties
final ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  iconTheme: const IconThemeData(color: AppColors.white),
  shadowColor: Colors.black54,
  scaffoldBackgroundColor: AppColors.darkScreenBackgroundColor,
  disabledColor: AppColors.black,
  primaryColor: AppColors.white,
  cardColor: AppColors.darkSectionBackgroundIColor,
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.accent,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: AppColors.white),
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
    shadowColor: AppColors.black,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.white),
    displayMedium: TextStyle(color: AppColors.white),
    bodySmall: TextStyle(color: AppColors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkScreenBackgroundColor,
    selectedItemColor: AppColors.darkMenuItemColorSelected,
    unselectedItemColor: AppColors.darkMenuItemColorUnselected.withOpacity(0.5),
  ),
  colorScheme: ThemeData().colorScheme.copyWith(
        secondary: AppColors.darkMenuItemColorUnselected.withOpacity(0.5),
        surface: Colors.white,
        primary: AppColors.primary,
      ),
  extensions: [
    CustomAppTheme(
      accent: AppColors.darkMenuItemColorSelected,
      buttonOrangeColor: AppColors.buttonOrange,
      secondaryColor: AppColors.secondary,
      ratingBackgroundColor: AppColors.backgroundGreen,
    ),
  ],
);
