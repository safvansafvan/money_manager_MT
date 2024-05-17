import 'package:get/get.dart';
import 'package:moneymanager/presentation/getx/category_db_controller.dart';
import 'package:moneymanager/presentation/getx/globel_controller.dart';
import 'package:moneymanager/presentation/getx/internet_controller.dart';
import 'package:moneymanager/presentation/getx/search_controller.dart';
import 'package:moneymanager/presentation/getx/transaction_db_controller.dart';

class InitCtrl {
  void init() {
    Get.put(GlobelController());
    Get.put(TransactionDbController());
    Get.put(CategoryDbController());
    Get.put(InternetController());
    Get.put(TransactionSearchController());
    Get.put(TransactionSearchController());
  }
}
