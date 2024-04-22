import 'package:get/get.dart';
import 'package:shopping/routes/app_router.dart';
import 'package:shopping/screens/dashbord/binding/dashbord.binding.dart';
import 'package:shopping/screens/dashbord/view/dashbord.view.dart';
import 'package:shopping/screens/home/binding/home.binding.dart';
import 'package:shopping/screens/home/view/home.view.dart';
import 'package:shopping/screens/login/binding/login.binding.dart';
import 'package:shopping/screens/login/view/login.view.dart';
import 'package:shopping/screens/product/binding/product.binding.dart';
import 'package:shopping/screens/product/view/product.view.dart';
import 'package:shopping/screens/register/binding/register.binding.dart';
import 'package:shopping/screens/register/view/register.view.dart';
import 'package:shopping/screens/splashscreen/binding/splash.binding.dart';
import 'package:shopping/screens/splashscreen/view/splash.view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASHSCREEN,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.REGISTER,
        page: () => const RegisterView(),
        binding: RegisterBinding()),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: DashbordBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),

    GetPage(
      name: AppRoutes.DASHBORD,
      page: () => const DashbordView(),
      binding: DashbordBinding(),
    ),
  ];
}
