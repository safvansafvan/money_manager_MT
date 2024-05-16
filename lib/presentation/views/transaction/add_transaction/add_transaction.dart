import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/domain/model/transaction.dart/transaction_model.dart';
import 'package:moneymanager/presentation/getx/globel_controller.dart';
import 'package:moneymanager/presentation/getx/transaction_db_controller.dart';
import 'package:moneymanager/presentation/views/transaction/add_transaction/widget/transaction_body.dart';
import 'package:moneymanager/presentation/widgets/snack_bar.dart';
import 'package:moneymanager/utils/constant/color.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController purposeController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    Get.put(GlobelController(), permanent: true).setDefultIncomeCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: TransactionBody(
              purposeController: purposeController,
              amountController: amountController,
              globalKey: globalKey),
        ),
      ),
    );
  }

  Future<void> addTrasnsaction() async {
    final globelController = Get.put(GlobelController());
    final transactionController = Get.put(TransactionDbController());
    if (globelController.selectIdDrop == null) {
      return snakBarWidget(context, 'Category Is Required', CustomColors.kred);
    }
    if (globelController.selectedCategoryModel == null) {
      return snakBarWidget(
          context, 'Select Income Or Expence', CustomColors.kred);
    }
    if (globelController.selectedDate == null) {
      return snakBarWidget(context, 'Date Is Required', CustomColors.kred);
    }
    final amount = double.parse(amountController.text);
    final model = TransactionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        purpose: purposeController.text,
        amount: amount,
        date: globelController.selectedDate!,
        type: globelController.selectedCategoryType!,
        category: globelController.selectedCategoryModel!);
    await transactionController.insertTransaction(model);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
