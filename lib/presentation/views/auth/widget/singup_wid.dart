import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/config/theme.dart';
import 'package:moneymanager/presentation/getx/auth_controller.dart';
import 'package:moneymanager/presentation/views/auth/widget/login_form.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/resouces/res.dart';

class SignUpWid extends StatelessWidget {
  const SignUpWid({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final lCtrl = Get.find<AuthCtrl>();
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
        ),
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoginFrom(
                  label: 'Name',
                  prefixIcon: Icons.person,
                  controller: lCtrl.nameCtrl,
                  inputType: TextInputType.name,
                  isname: true,
                ),
                LoginFrom(
                  label: 'Email',
                  prefixIcon: Icons.email,
                  controller: lCtrl.emailCtrl,
                  inputType: TextInputType.emailAddress,
                  isUsername: true,
                ),
                LoginFrom(
                  label: 'Number',
                  prefixIcon: Icons.phone,
                  controller: lCtrl.phoneCtrl,
                  inputType: TextInputType.number,
                  isnumber: true,
                ),
                LoginFrom(
                  label: 'Password',
                  prefixIcon: Icons.key,
                  controller: lCtrl.passwordCtrl,
                  inputType: TextInputType.name,
                  isPassword: true,
                ),
                LoginFrom(
                  label: 'Conform Password',
                  prefixIcon: Icons.key,
                  controller: lCtrl.conformpasswordCtrl,
                  inputType: TextInputType.name,
                  isconformPassword: true,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppTheme.buttonStyle,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'SIGNUP',
                          style: CustomFuction.style(
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: CustomColors.kwhite),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
