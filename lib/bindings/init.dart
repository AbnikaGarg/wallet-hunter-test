
import 'package:get/get.dart';

import '../controllers/splashController.dart';


class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<splashController>(() => splashController());
  }
}
