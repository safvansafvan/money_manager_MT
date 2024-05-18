import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moneymanager/presentation/getx/category_db_controller.dart';
import 'package:moneymanager/presentation/getx/transaction_db_controller.dart';
import 'package:moneymanager/presentation/views/auth/auth.dart';
import 'package:moneymanager/presentation/views/home/home_screen.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/constant/duration.dart';
import 'package:moneymanager/utils/resouces/res.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    navigation(context);
    Get.find<CategoryDbController>().reloadUi();
    Get.find<TransactionDbController>().refreshTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'W A L L E T  A P P',
              style: CustomFuction.style(
                fontWeight: FontWeight.bold,
                size: 15,
                color: CustomColors.appClr,
              ),
            ),
            Lottie.asset('assets/animation/app_loading.json',
                height: 60, width: 60),
          ],
        ),
      ),
    );
  }

  Future<void> navigation(context) async {
    await Future.delayed(const Duration(seconds: 3), () {});
    await Get.to(() => const LoginView(),
        transition: Transition.zoom,
        curve: Curves.easeOut,
        duration: AppDuration.appDuration);
  }
}
