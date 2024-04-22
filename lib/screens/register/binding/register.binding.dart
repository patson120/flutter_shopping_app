import 'package:get/get.dart';
import 'package:shopping/screens/register/controller/register.ctrl.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}