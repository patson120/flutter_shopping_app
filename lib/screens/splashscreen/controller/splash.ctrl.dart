import 'package:get/get.dart';
import 'package:shopping/routes/app_router.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shopping/services/local/authentication/authentication_services_impl.dart';

class SplashController extends GetxController {
  final LocalAuthentificationService _serviceImpl =
      LocalAuthentificationServiceImpl();

  @override
  void onInit() async {
    if (await _serviceImpl.hasAuthToken()) {
      Future.delayed(const Duration(microseconds: 800))
          .then((value) => {Get.offAllNamed(AppRoutes.DASHBORD)});
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }

    super.onInit();
  }
}
