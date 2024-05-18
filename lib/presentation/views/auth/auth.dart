import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/presentation/getx/auth_controller.dart';
import 'package:moneymanager/presentation/views/auth/widget/login_wid.dart';
import 'package:moneymanager/presentation/views/auth/widget/singup_wid.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/resouces/res.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kwhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<AuthCtrl>(
            builder: (lCtrl) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          lCtrl.isLogin == false ? 'LOGIN' : 'SINGUP',
                          style: CustomFuction.style(
                              fontWeight: FontWeight.bold,
                              size: 26,
                              color: CustomColors.appClr),
                        ),
                      ),
                    ),
                    lCtrl.isLogin == false
                        ? const SizedBox(height: 180)
                        : const SizedBox(height: 50),
                    lCtrl.isLogin == false
                        ? const LoginWidget()
                        : const SignUpWid(),
                    GestureDetector(
                      onTap: () {
                        lCtrl.loginState();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: lCtrl.isLogin == false
                              ? "Don't have An Account ?"
                              : 'have An Account ?',
                          style: TextStyle(color: CustomColors.kgrey),
                          children: [
                            TextSpan(
                              text:
                                  lCtrl.isLogin == false ? 'Sign Up' : 'Login',
                              style: TextStyle(
                                  color: CustomColors.kblack,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
