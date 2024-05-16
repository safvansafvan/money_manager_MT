import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/presentation/getx/transaction_db_controller.dart';
import 'package:moneymanager/presentation/views/category/category.dart';
import 'package:moneymanager/presentation/views/search/search_transaction.dart';
import 'package:moneymanager/presentation/views/settings/settins.dart';
import 'package:moneymanager/presentation/views/transaction/widgets/custom_cliper_shape.dart';
import 'package:moneymanager/presentation/views/transaction/widgets/money_status_bar.dart';
import 'package:moneymanager/presentation/widgets/common_header.dart';
import 'package:moneymanager/presentation/widgets/empty_lottie.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/constant/duration.dart';
import 'package:moneymanager/utils/resouces/res.dart';

import 'widgets/transaction_field_widget.dart';

class TrasactionsScreen extends StatelessWidget {
  const TrasactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.put(TransactionDbController()).calculateIncomeAndExpence();
    });
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.19,
            width: double.infinity,
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomClipperShape(),
                  child: Container(
                    height: screenSize.height * 0.22,
                    width: double.infinity,
                    decoration: BoxDecoration(color: CustomColors.appClr),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await Get.to(() => const Settings(),
                                  transition: Transition.leftToRight,
                                  curve: Curves.easeOut,
                                  duration: AppDuration.appDuration);
                            },
                            icon: Icon(Icons.settings,
                                color: CustomColors.kwhite),
                          ),
                          Text(
                            "WALLET APP",
                            style: CustomFuction.style(
                                fontWeight: FontWeight.w600,
                                size: 17,
                                color: CustomColors.kwhite),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Get.to(() => const SearchTransaction(),
                                  transition: Transition.rightToLeft,
                                  curve: Curves.easeOut,
                                  duration: AppDuration.appDuration);
                            },
                            icon: Icon(
                              Icons.search,
                              color: CustomColors.kwhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 30,
                  right: 30,
                  child: MoneyStatusBar(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonHeader('Last Transations'),
                InkWell(
                  onTap: () async {
                    await Get.to(() => const CategoryScreen(),
                        curve: Curves.easeOut,
                        transition: Transition.size,
                        duration: AppDuration.appDuration);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: CustomColors.appClr,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Statics',
                      style: CustomFuction.style(
                          fontWeight: FontWeight.w500,
                          size: 13,
                          color: CustomColors.kwhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<TransactionDbController>(builder: (controller) {
            if (controller.transaction.isEmpty) {
              return emptyLottiePop(
                  messsage: 'No Transaction', screenSize: screenSize);
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final values = controller.transaction[index];
                String date = DateFormat.MMMd().format(values.date);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TransactionFieldWidget(
                      screenSize: screenSize, values: values, date: date),
                );
              },
              itemCount: controller.transaction.length,
            );
          })
        ],
      ),
    );
  }
}
