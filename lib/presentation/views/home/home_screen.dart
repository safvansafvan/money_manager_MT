import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/presentation/views/transaction/add_transaction/add_transaction.dart';
import 'package:moneymanager/presentation/views/transaction/transactions.dart';
import 'package:moneymanager/utils/constant/duration.dart';

// ignore: must_be_immutable
class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TrasactionsScreen(),
      floatingActionButton: FloatingActionButton.small(
        tooltip: "Add",
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(() => const AddTransaction(),
              transition: Transition.zoom,
              curve: Curves.easeOut,
              duration: AppDuration.appDuration);
        },
      ),
    );
  }
}
