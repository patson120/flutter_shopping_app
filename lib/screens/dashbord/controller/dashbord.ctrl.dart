

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/screens/cart/view/cart.view.dart';
import 'package:shopping/screens/home/view/home.view.dart';
import 'package:shopping/screens/profil/view/profil.view.dart';

class DashbordController extends GetxController {
  
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeView(),
    const CartView(),
    const ProfilView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}