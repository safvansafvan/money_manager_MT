import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/presentation/views/transaction/add_transaction/add_transaction.dart';
import 'package:moneymanager/presentation/views/transaction/transactions.dart';
import 'package:moneymanager/utils/constant/duration.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TransactionHomeView(),
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
