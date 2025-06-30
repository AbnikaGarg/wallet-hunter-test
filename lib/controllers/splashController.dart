import 'dart:async';
import 'package:get/get.dart';
import 'package:wallethunter/view/auth/login.dart';
import 'package:wallethunter/view/home/bottombar.dart';

import '../services/shared_pref_service.dart';

class splashController extends GetxController {
  final appName = "Family Registration";

  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(seconds: 2), () {
      if (PreferenceUtils.isLoggedIn()) {
        Get.offAll(BottomBar());
      } else {
        Get.offAll(LoginScreen());
      }
    });
    // }
  }
}
