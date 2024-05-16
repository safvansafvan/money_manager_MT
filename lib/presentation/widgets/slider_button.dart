import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class SliderButtonWidget extends StatelessWidget {
  const SliderButtonWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: () async {
        return true;
      },
      label: Text(
        text,
        style: const TextStyle(
            color: Color(0xff4a4a4a),
            fontWeight: FontWeight.w500,
            fontSize: 17),
      ),
      shimmer: true,
      vibrationFlag: true,
      icon: const CircleAvatar(
        radius: 32,
        backgroundImage: AssetImage(
          'assets/images/checked.png',
        ),
        backgroundColor: Color(0xff4a4a4a),
      ),
    );
  }
}
