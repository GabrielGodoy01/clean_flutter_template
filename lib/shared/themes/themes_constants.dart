import 'package:clean_flutter_template/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
    primaryColor: AppColors.primary,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.accent),
    textTheme: TextTheme(
      headline1: AppTextStyles.headline1,
      headline2: AppTextStyles.headline2,
      headline3: AppTextStyles.headline3,
      bodyText1: AppTextStyles.bodyText1,
      bodyText2: AppTextStyles.bodyText2,
      subtitle1: AppTextStyles.subtitle1,
      subtitle2: AppTextStyles.subtitle2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.accent))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)));

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(AppColors.primary),
    thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
  ),
  textTheme: TextTheme(
    headline1: AppTextStyles.headline1.copyWith(color: AppColors.white),
    headline2: AppTextStyles.headline2.copyWith(color: AppColors.white),
    headline3: AppTextStyles.headline3.copyWith(color: AppColors.white),
    bodyText1: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
    bodyText2: AppTextStyles.bodyText2.copyWith(color: AppColors.white),
    subtitle1: AppTextStyles.subtitle1.copyWith(color: AppColors.white),
    subtitle2: AppTextStyles.subtitle2.copyWith(color: AppColors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);
