import 'package:get/get.dart';
import 'package:moneymanager/presentation/controllers/auth_controller.dart';
import 'package:moneymanager/presentation/controllers/category_db_controller.dart';
import 'package:moneymanager/presentation/controllers/globel_controller.dart';
import 'package:moneymanager/presentation/controllers/search_controller.dart';
import 'package:moneymanager/presentation/controllers/transaction_db_controller.dart';

class InitCtrl {
  void init() {
    Get.put(GlobelController());
    Get.put(TransactionDbController());
    Get.put(CategoryDbController());
    Get.put(TransactionSearchController());
    Get.put(AuthCtrl());
  }
}
