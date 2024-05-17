import 'package:flutter/material.dart';
import 'package:moneymanager/utils/constant/color.dart';

// ignore: must_be_immutable
class CommonTextFormField extends StatelessWidget {
  CommonTextFormField(
      {super.key,
      required this.controller,
      required this.title,
      required this.keyboardType,
      required this.screenSize,
      this.maxLength});

  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  int? maxLength;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.074,
      width: double.infinity,
      child: TextFormField(
        cursorColor: CustomColors.appClr,
        controller: controller,
        maxLength: maxLength,
        maxLines: 1,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: title,
            contentPadding: EdgeInsets.zero),
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required";
          }
          return null;
        },
      ),
    );
  }
}
