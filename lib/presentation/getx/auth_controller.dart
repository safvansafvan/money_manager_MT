import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCtrl extends GetxController {
  bool isLogin = false;
  bool isobx = true;

  void loginState() {
    isLogin = !isLogin;
    update();
  }

  void passwordObx() {
    isobx = !isobx;
    update();
  }

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController conformpasswordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
}
