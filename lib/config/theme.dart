import 'package:flutter/material.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/resouces/res.dart';

class AppTheme {
  static FloatingActionButtonThemeData floatingActionButtonTheme =
      FloatingActionButtonThemeData(
    backgroundColor: CustomColors.appClr,
    elevation: 20,
    foregroundColor: CustomColors.kwhite,
    hoverElevation: 2,
    hoverColor: CustomColors.kgreen,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: CustomColors.appClr,
    centerTitle: true,
    elevation: 0,
    foregroundColor: CustomColors.kwhite,
    titleTextStyle: CustomFuction.style(fontWeight: FontWeight.w600, size: 17),
  );
}
