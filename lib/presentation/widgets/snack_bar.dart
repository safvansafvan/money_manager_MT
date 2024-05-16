import 'package:flutter/material.dart';
import 'package:moneymanager/utils/constant/color.dart';

void snakBarWidget(context, String msg, Color clr) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Center(
        child: Text(
          msg,
          style: TextStyle(
            color: CustomColors.kwhite,
            fontSize: 15,
          ),
        ),
      ),
      backgroundColor: clr,
      elevation: 13,
      duration: const Duration(seconds: 1),
    ),
  );
}
