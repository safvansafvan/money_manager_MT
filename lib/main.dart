import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moneymanager/config/theme.dart';
import 'package:moneymanager/domain/model/category/category_model.dart';
import 'package:moneymanager/domain/model/transaction.dart/transaction_model.dart';
import 'package:moneymanager/firebase_options.dart';
import 'package:moneymanager/presentation/views/splash/screen_loding.dart';
import 'package:moneymanager/utils/constant/color.dart';
import 'package:moneymanager/utils/resouces/init_controllers.dart';
import 'package:moneymanager/utils/resouces/notification.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  NotificationSetup.init();
  InitCtrl().init();
  await NotificationSetup.scheduleDailyNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'money manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.appClr),
        useMaterial3: true,
        floatingActionButtonTheme: AppTheme.floatingActionButtonTheme,
        appBarTheme: AppTheme.appBarTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const InitialScreen(),
    );
  }
}
