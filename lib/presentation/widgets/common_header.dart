import 'package:flutter/material.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/resouces/res.dart';

Text commonHeader(String text) {
  return Text(
    text,
    style: CustomFuction.style(
      fontWeight: FontWeight.bold,
      size: 17,
      color: CustomColors.kblack,
    ),
  );
}
