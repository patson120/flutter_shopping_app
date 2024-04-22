import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_snackbar.dart';
import 'package:shopping/core/app_state.dart';
import 'package:shopping/models/response/user_model.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shopping/services/local/authentication/authentication_services_impl.dart';
import 'package:shopping/services/remote/product/product.dart';

class CartController extends GetxController {
  LoadingStatus infinityStatus = LoadingStatus.initial;

  final LocalAuthentificationService _authService =
      LocalAuthentificationServiceImpl();

  final ProductService _productService = ProductServiceImpl();

  dynamic paniers = [];
  int totalAmout = 0;

  User? user;

  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    final data = await _authService.getUser();
    if (data != null) {
      user = User.fromJson(jsonDecode(data));
      await getCarts(user!.id!);
    }
  }

  void getTotalAmout() {
    int? total = 0;
    for (var i = 0; i < paniers.length; i++) {
      total = total! + (paniers[i]["total"] as int);
    }
    totalAmout = total!;
    update();
  }

  Future<void> getCarts(int userId) async {
    infinityStatus = LoadingStatus.searching;
    await _productService.getCarts(
      userId: userId,
      onSuccess: (data) {
        paniers = data["carts"][0]["products"];
        getTotalAmout();
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

  Future<void> addToCart(BuildContext context, int index) async {
    paniers[index]["quantity"] = paniers[index]["quantity"] + 1;
    final dynamic object = {
      "userId": user!.id!,
      "products": [
        {
          "id": paniers[index]["id"],
          "quantity": 1,
        },
      ]
    };

    await _productService.addToCart(
      data: object,
      onSuccess: (data) {
        CustomSnacbar.showMessage(
            context, "${paniers[index]["title"]} ajouté au panier avec succès");
        update();
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }
}
