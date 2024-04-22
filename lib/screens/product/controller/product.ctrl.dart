import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_snackbar.dart';
import 'package:shopping/models/response/product_model.dart';
import 'package:shopping/models/response/user_model.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shopping/services/local/authentication/authentication_services_impl.dart';
import 'package:shopping/services/remote/product/product.dart';

class ProductController extends GetxController {
  Product? product;

  final ProductService _productService = ProductServiceImpl();
  final LocalAuthentificationService _authService =
      LocalAuthentificationServiceImpl();

  User? user;
  int quantity = 0;

  @override
  void onInit() {
    product = Get.arguments as Product;
    getUser();
    super.onInit();
  }

  void increment() {
    quantity++;
    update();
  }

  void decrement() {
    quantity--;
    update();
  }

  Future<void> getUser() async {
    final data = await _authService.getUser();
    if (data != null) {
      user = User.fromJson(jsonDecode(data));
    }
  }

  Future<void> addToCart(BuildContext context) async {
    increment();
    final dynamic object = {
      "userId": user!.id!,
      "products": [
        {
          "id": product!.id!,
          "quantity": 1,
        },
      ]
    };

    await _productService.addToCart(
      data: object,
      onSuccess: (data) {
        CustomSnacbar.showMessage(
            context, "${product!.title!} ajouté au panier avec succès");
        update();
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }
}
