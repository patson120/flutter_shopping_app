import 'package:get/get.dart';
import 'package:shopping/screens/product/controller/product.ctrl.dart';

class ProductBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}