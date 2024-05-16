import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moneymanager/config/theme.dart';
import 'package:moneymanager/domain/model/category/category_model.dart';
import 'package:moneymanager/domain/model/transaction.dart/transaction_model.dart';
import 'package:moneymanager/presentation/views/splash/screen_loding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'money manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        floatingActionButtonTheme: AppTheme.floatingActionButtonTheme,
        appBarTheme: AppTheme.appBarTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const InitialScreen(),
    );
  }
}
