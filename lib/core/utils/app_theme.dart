import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/app_colors.dart';

class AppTheme{

final ThemeData lightThemeData = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  iconTheme: IconThemeData(
    color: AppColors.black
  ),
  switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(AppColors.background),
    thumbColor: MaterialStateProperty.all(AppColors.white)
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white
  ),
  primaryColor: AppColors.grey,

  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600
    ),
    titleMedium: TextStyle(
      color: AppColors.background,
        fontWeight: FontWeight.w600,
          fontSize: 14,

    ),
    titleSmall: TextStyle(
      color: AppColors.background,

    )
  )
);

final ThemeData darkThemeData = ThemeData(
  iconTheme: IconThemeData(
    color: AppColors.white
  ),

  scaffoldBackgroundColor: AppColors.darkmoodcolor,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkmoodcolor
  ),
  switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.white),
    trackColor: MaterialStateProperty.all(AppColors.darkblue)
  ),
  primaryColor: AppColors.darkblue,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600
    ),
    titleMedium: TextStyle(
      color: AppColors.white,
        fontSize: 14,
      fontWeight: FontWeight.w600
    ),
      titleSmall: TextStyle(
        color: AppColors.background,

      )
  ),

);

}

bool switchValue=false;