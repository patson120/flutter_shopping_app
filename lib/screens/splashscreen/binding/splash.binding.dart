

import 'package:get/get.dart';
import 'package:shopping/screens/splashscreen/controller/splash.ctrl.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}