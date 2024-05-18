import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/presentation/views/auth/auth.dart';
import 'package:moneymanager/presentation/views/home/home_screen.dart';
import 'package:moneymanager/presentation/widgets/toast_msg.dart';
import 'package:moneymanager/utils/constant/duration.dart';

class AuthCtrl extends GetxController {
  bool isLogin = false;
  bool isobx = true;
  User? user;
  FirebaseAuth auth = FirebaseAuth.instance;
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

  handleScreens(context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Get.off(() => const MyHomeScreen(),
          transition: Transition.zoom,
          curve: Curves.easeOut,
          duration: AppDuration.appDuration);
    } else {
      return Get.off(() => const LoginView(),
          transition: Transition.zoom,
          curve: Curves.easeOut,
          duration: AppDuration.appDuration);
    }
  }

// logout
  Future<void> logout(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await auth.signOut();
      await Get.offAll(() => const LoginView(),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          transition: Transition.zoom);
      messageToast('Logout Succeed');
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  ///*************************** singup with email and password *********************************
  bool isSignUpLoading = false;
  Future<void> signUpWithEmailAndPassword(BuildContext ctx) async {
    isSignUpLoading = true;
    update();
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailCtrl.text, password: passwordCtrl.text);

      if (credential.user != null) {
        clearController1();
        messageToast('SignUp SuccessFully');
        isSignUpLoading = false;
        update();
        return Get.off(() => const MyHomeScreen(),
            transition: Transition.zoom,
            curve: Curves.easeOut,
            duration: AppDuration.appDuration);
      }
    } catch (e) {
      log(e.toString());
    }
    isSignUpLoading = false;
    update();
  }

//*********************************************signin with email and password *******************************************
  bool isSignInLoading = false;
  Future<void> signInWithEmailAndPasswords(BuildContext ctx) async {
    isSignInLoading = true;
    update();
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: emailCtrl.text, password: passwordCtrl.text);

      if (credential.user != null) {
        clearController();
        messageToast('Login SuccessFully');
        isSignInLoading = false;
        update();
        return await Get.offAll(() => const MyHomeScreen());
      } else {
        messageToast('Something Wrong');
      }
    } catch (e) {
      messageToast('SignUp is required');
      log(e.toString());
    }
    isSignInLoading = false;
    update();
  }

  clearController() {
    emailCtrl.clear();
    passwordCtrl.clear();
  }

  clearController1() {
    emailCtrl.clear();
    passwordCtrl.clear();
    conformpasswordCtrl.clear();
    nameCtrl.clear();
  }
}
