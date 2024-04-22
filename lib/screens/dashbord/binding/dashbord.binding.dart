

import 'package:get/get.dart';
import 'package:shopping/screens/cart/controller/cart.ctrl.dart';
import 'package:shopping/screens/dashbord/controller/dashbord.ctrl.dart';
import 'package:shopping/screens/home/controller/home.ctrl.dart';
import 'package:shopping/screens/profil/controller/profil.ctrl.dart';

class DashbordBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashbordController>(() => DashbordController(), fenix: true);

    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<ProfilController>(() => ProfilController(), fenix: true);
    
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    
  }
}