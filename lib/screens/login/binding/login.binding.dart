

import 'package:get/get.dart';
import 'package:shopping/screens/login/controller/login.ctrl.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}