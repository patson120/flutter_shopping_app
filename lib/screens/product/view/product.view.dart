import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/screens/product/controller/product.ctrl.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Product Detail"),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: Get.width,
                    decoration: const BoxDecoration(),
                    child: Image.network(
                      controller.product!.thumbnail!,
                      fit: BoxFit.fill,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.product!.title!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                          Text(
                            "${controller.product!.price!} £",
                            style: const TextStyle(
                                color: kOrangeColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.product!.description!,
                        style: const TextStyle(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.room,
                                  color: kDarkColor, size: 16),
                              Text(
                                "Rating ${controller.product!.rating!}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: kOrangeColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () { controller.decrement();},
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: kOrangeColor),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${controller.quantity}",
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
                                onTap: () { controller.addToCart(context);},
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.0, color: kOrangeColor),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
