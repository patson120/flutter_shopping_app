import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/screens/dashbord/controller/dashbord.ctrl.dart';

class DashbordView extends GetView<DashbordController> {
  const DashbordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashbordController>(
        builder: (controller) => Scaffold(
              backgroundColor: kWhiteColor,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.selectedIndex,
                onTap: (index) { controller.onItemTapped(index); },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
              body: controller.pages[controller.selectedIndex]
            ));
  }
}
