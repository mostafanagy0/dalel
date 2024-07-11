import 'package:dalel/app/dalel_app.dart';
import 'package:dalel/core/database/cashe/cash_helper.dart';
import 'package:dalel/core/func/check_stste_changes.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  chackStateChanges();
  runApp(const Dalel());
}
