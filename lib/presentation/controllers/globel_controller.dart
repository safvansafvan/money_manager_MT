import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/domain/model/category/category_model.dart';
import 'package:moneymanager/presentation/widgets/toast_msg.dart';
import 'package:moneymanager/utils/resouces/notification.dart';

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

  DateTime? selectedTime;

  void selectTime(BuildContext context) async {
    await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 20)));
    messageToast(selectedTime.toString());
    NotificationService().scheduleNotification(
        title: 'Scheduled Notification',
        body: '$selectedTime',
        scheduledNotificationDateTime: selectedTime!);
  }
}
