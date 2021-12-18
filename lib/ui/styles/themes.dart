import 'package:electronic_shop/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get baseTheme{
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        title: TextStyle(
          color: AppColors.textColor, 
          fontSize: 18, 
          letterSpacing: 1,
        ), 
        body1: TextStyle(
          color: AppColors.primaryColor, 
          fontSize: 14, 
          fontWeight: FontWeight.w400
        )
      ),
    );
  }
}