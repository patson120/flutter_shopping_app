import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_snackbar.dart';
import 'package:shopping/core/app_state.dart';
import 'package:shopping/models/response/product_model.dart';
import 'package:shopping/models/response/user_model.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shopping/services/local/authentication/authentication_services_impl.dart';
import 'package:shopping/services/remote/product/product.dart';

class HomeController extends GetxController {
  LoadingStatus infinityStatus = LoadingStatus.initial;

  final LocalAuthentificationService _authService =
      LocalAuthentificationServiceImpl();

  final ProductService _productService = ProductServiceImpl();

  RxInt selectedCategorieIndex = 0.obs;

  User? user;

  @override
  void onInit() async {
    await getUser();
    await getProductsTop('tops');
    await changeProductCategory(categories[selectedCategorieIndex.value]);
    super.onInit();
  }

  List<Product> products = [];
  List<Product> productsTop = [];

  final List<String> categories = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ];

  Future<void> getUser() async {
    final data = await _authService.getUser();
    if (data != null) {
      user = User.fromJson(jsonDecode(data));
    }
  }

  Future changeSelectedCategory(int index) async {
    if (selectedCategorieIndex.value != index) {
      selectedCategorieIndex.value = index;
      await changeProductCategory(categories[index]);
      update();
    }
  }

  Future<void> changeProductCategory(String category) async {
    infinityStatus = LoadingStatus.searching;
    await _productService.getProductsTop(
      category: category,
      onSuccess: (data) {
        products =
            List<Product>.from(data['products'].map((x) => Product.fromMap(x)));
        infinityStatus = LoadingStatus.completed;
        update();
      },
      onError: (error) {
        print(error);
        infinityStatus = LoadingStatus.failed;
        update();
      },
    );
  }

  Future<void> addToCart(BuildContext context, Product product) async {
    final dynamic object = {
      "userId": user!.id!,
      "products": [
        {
          "id": product.id,
          "quantity": 1,
        },
      ]
    };

    await _productService.addToCart(
      data: object,
      onSuccess: (data) {
        CustomSnacbar.showMessage(context, "${product.title} ajouté au panier avec succès");
        update();
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }

  Future<void> getProductsTop(String category) async {
    // infinityStatus = LoadingStatus.searching;
    await _productService.getProductsTop(
      category: category,
      onSuccess: (data) {
        productsTop =
            List<Product>.from(data['products'].map((x) => Product.fromMap(x)));
        // infinityStatus = LoadingStatus.completed;
        update();
      },
      onError: (error) {
        print(error);
        // infinityStatus = LoadingStatus.failed;
        update();
      },
    );
  }
}
