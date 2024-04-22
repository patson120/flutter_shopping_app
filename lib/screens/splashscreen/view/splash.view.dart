import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/screens/splashscreen/controller/splash.ctrl.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => SafeArea(
              child: Scaffold(
                body: Container(
                  decoration: const BoxDecoration(color: kPrimaryColor),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "SHOP",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "PING",
                          style: TextStyle(
                              color: kDarkColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
