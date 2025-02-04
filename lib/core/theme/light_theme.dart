import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_theme.dart';

// Light theme properties
final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  iconTheme: const IconThemeData(color: AppColors.white),
  shadowColor: Colors.black54,
  scaffoldBackgroundColor: AppColors.backgroundGrey,
  disabledColor: AppColors.black,
  primaryColor: AppColors.primary,
  cardColor: AppColors.white,
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
    displayLarge: TextStyle(color: AppColors.primary),
    displayMedium: TextStyle(color: AppColors.secondary),
    bodySmall: TextStyle(color: AppColors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundGrey,
    selectedItemColor: AppColors.menuItemColorSelected,
    unselectedItemColor: AppColors.menuItemColorUnselected,
  ),
  colorScheme: ThemeData().colorScheme.copyWith(
        secondary: AppColors.accent,
        surface: Colors.white,
        primary: AppColors.primary,
      ),
  extensions: [
    CustomAppTheme(
      accent: AppColors.accent,
      buttonOrangeColor: AppColors.buttonOrange,
      secondaryColor: AppColors.secondary,
      ratingBackgroundColor: AppColors.backgroundGreen,
    ),
  ],
);
