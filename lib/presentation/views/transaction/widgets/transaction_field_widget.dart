import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:moneymanager/domain/model/category/category_model.dart';
import 'package:moneymanager/domain/model/transaction.dart/transaction_model.dart';
import 'package:moneymanager/presentation/controllers/transaction_db_controller.dart';
import 'package:moneymanager/presentation/views/transaction/edit_transactions/edit_transactions.dart';
import 'package:moneymanager/presentation/views/transaction/view_transaction/view_transaction.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/constant/duration.dart';
import 'package:moneymanager/utils/resouces/res.dart';

class TransactionFieldWidget extends StatelessWidget {
  const TransactionFieldWidget(
      {super.key,
      required this.screenSize,
      required this.values,
      required this.date});

  final Size screenSize;
  final TransactionModel values;
  final String date;

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionDbController>();
    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) async {
            await transactionController.remove(values.id);
          },
          icon: Icons.delete,
          foregroundColor: CustomColors.kred,
          label: 'Delete',
        ),
        SlidableAction(
          onPressed: (context) async {
            await Get.to(() => EditTransactions(object: values),
                transition: Transition.zoom,
                curve: Curves.easeOut,
                duration: AppDuration.appDuration);
          },
          icon: Icons.edit,
          foregroundColor: CustomColors.kblue,
          label: 'Edit',
        ),
      ]),
      child: Container(
        height: screenSize.height * 0.1,
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: ListTile(
            onTap: () async {
              await Get.to(() => ViewTransaction(object: values),
                  transition: Transition.zoom,
                  curve: Curves.easeOut,
                  duration: AppDuration.appDuration);
            },
            leading: CircleAvatar(
              backgroundColor: values.type == CategoryType.income
                  ? CustomColors.kgreen
                  : CustomColors.kred,
              radius: 30,
              child: Text(
                date,
                style: TextStyle(color: CustomColors.kwhite),
              ),
            ),
            subtitle: Text(
              values.purpose.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  CustomFuction.style(fontWeight: FontWeight.normal, size: 12),
            ),
            title: Text(
              values.category.type.name,
              style: CustomFuction.style(fontWeight: FontWeight.w600, size: 16),
            ),
            trailing: Text(
              '\$${values.amount}',
              style: CustomFuction.style(fontWeight: FontWeight.w600, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
