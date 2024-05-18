import 'package:get/get.dart';
import 'package:moneymanager/domain/model/category/category_model.dart';

class GlobelController extends GetxController {
  RxString? selectIdDrop;
  DateTime? selectedDate;
  CategoryType? selectedCategoryType;
  CategoryModel? selectedCategoryModel;

  void updateDate(DateTime date) {
    selectedDate = date;
    update();
  }

  void setDefultIncomeCategory() {
    selectedCategoryType = CategoryType.income;
  }

  void updateCategoryType(CategoryType value) {
    selectedCategoryType = value;
    update();
  }

  void updateDropDownId(String value) {
    selectIdDrop = RxString(value);
    update();
  }
}
