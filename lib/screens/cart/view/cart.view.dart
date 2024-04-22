import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/screens/cart/controller/cart.ctrl.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Cart"),
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      ...List.generate(controller.paniers.length,
                          (index) => CartItem(
                            context: context,
                            controller: controller,
                            index: index,
                            cart: controller.paniers[index])),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${controller.totalAmout} £",
                            style: const TextStyle(
                                fontSize: 22, color: kOrangeColor, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 30,
                        ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class CartItem extends StatelessWidget {
  final dynamic cart;
  final BuildContext context;
  final dynamic controller;
  final int index;
  const CartItem({
    super.key,
    required this.cart,
    required this.context,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 120,
            decoration: const BoxDecoration(color: kOrangeColor),
            child: Image.network(
              cart["thumbnail"],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(
                  cart["title"],
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  "${cart['price']} £",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: kOrangeColor),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                         Text(
                          cart['quantity'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: kOrangeColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                           await controller.addToCart(context, index);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: kOrangeColor),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete_forever,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
