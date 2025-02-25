import 'package:dalel/core/database/cashe/cash_helper.dart';
import 'package:dalel/core/func/navigation.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/App_Strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisisted =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisisted == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigation(context, "/signIn")
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? delayedNavigation(context, "/homeNavBar")
              : delayedNavigation(context, "/signIn");
    } else {
      delayedNavigation(context, "/onBoarding");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}

void delayedNavigation(context, path) {
  Future.delayed(const Duration(seconds: 2), () {
    customReplacementNavigate(context, "/onBording");
  });
}
