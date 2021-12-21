import 'package:electronic_shop/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get baseTheme{
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: AppColors.textColor,
          fontSize: 30,
          letterSpacing: 1,
          fontWeight: FontWeight.w600
        ),
        headline2: TextStyle(
            color: AppColors.textColor,
            fontSize: 32,
            letterSpacing: 1,
            fontWeight: FontWeight.w700
        ),

        headline3: TextStyle(
            color: Colors.red,
            fontSize: 26,
            letterSpacing: 1,
            fontWeight: FontWeight.w500
        ),
        headline4: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            letterSpacing: 1,
            fontWeight: FontWeight.w600
        ),
        bodyText1: TextStyle(
          color: AppColors.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),

        bodyText2: TextStyle(
            color: AppColors.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w700
        ),
        caption: TextStyle(
            color: AppColors.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
          subtitle1:  TextStyle(
            color: AppColors.textColor,
            fontSize: 22,
            fontWeight: FontWeight.w800
        ),
        subtitle2:  TextStyle(
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w800
        ),

      ),
    );
  }
}