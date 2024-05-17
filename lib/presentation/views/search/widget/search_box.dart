import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanager/presentation/getx/search_controller.dart';
import 'package:moneymanager/utils/constant/color.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<TransactionSearchController>();

    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CustomColors.kblack)),
      child: TextField(
        controller: searchController.searchController,
        onChanged: (value) {
          searchController.searchTransaction(value);
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search...',
            suffixIcon: IconButton(
                onPressed: () {
                  searchController.clearFieldText();
                },
                icon: const Icon(Icons.close)),
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
      ),
    );
  }
}
