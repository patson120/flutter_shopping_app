import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/components/category_item.dart';
import 'package:shopping/components/product_card.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/core/app_sizes.dart';
import 'package:shopping/core/app_state.dart';
import 'package:shopping/screens/home/controller/home.ctrl.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              backgroundColor: kWhiteColor,
              appBar: AppBar(
                backgroundColor: kWhiteColor,
                title: const Row(
                  children: [
                    Text(
                      "SHOP",
                      style: TextStyle(
                          color: kOrangeColor, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "PING",
                      style: TextStyle(
                          color: kDarkColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                actions: <Widget>[
                  controller.user != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(controller.user!.image!),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "TOP ",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 240,
                        width: Get.width,
                        decoration: const BoxDecoration(
                            // color: Colors.red,
                            ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                  controller.productsTop.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: ProductCard(
                                            addToCart: () async {
                                              controller.addToCart(
                                                  context,
                                                  controller
                                                      .productsTop[index]);
                                            },
                                            product:
                                                controller.productsTop[index]),
                                      ))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: kDefaultMargin * 1.6),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...List.generate(
                            controller.categories.length,
                            (index) => CategoryItem(
                                title: controller.categories[index],
                                index: index,
                                controller: controller,
                                onTap: () async {
                                  await controller
                                      .changeSelectedCategory(index);
                                }),
                          ),
                        ]),
                      ),
                      const SizedBox(height: kDefaultMargin * 2.6),
                      controller.infinityStatus == LoadingStatus.searching
                          // && controller.products.isEmpty
                          ? Container(
                              height: 200,
                              width: Get.width,
                              decoration: const BoxDecoration(),
                              child: const Center(
                                child: CircularProgressIndicator(
                                    color: kTextColor),
                              ),
                            )
                          : Container(
                              height:
                                  (controller.products.length / 2) * 220 + 200,
                              decoration: const BoxDecoration(),
                              child: Wrap(
                                runSpacing: kDefaultPadding - 10,
                                spacing: kDefaultPadding + 4,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ...List.generate(
                                      controller.products.length,
                                      (index) => ProductCard(
                                          addToCart: () async {
                                            controller.addToCart(context,
                                                controller.products[index]);
                                          },
                                          product: controller.products[index])),
                                  controller.infinityStatus ==
                                          LoadingStatus.searching
                                      ? Container(
                                          padding: const EdgeInsets.all(0),
                                          height: 220,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                                color: kOrangeColor),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),

                      // controller.products.isEmpty &&
                      //         controller.infinityStatus ==
                      //             LoadingStatus.completed
                      //     ? Expanded(
                      //         flex: 3,
                      //         child: Container(
                      //           decoration: const BoxDecoration(),
                      //           width: double.infinity,
                      //           child: Text(
                      //             "Ooops !!!\nAucun produit trouvé",
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //               color: kGreyColor.withOpacity(0.7),
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : Container(),
                    ],
                  ),
                ),
              ),
            ));
  }
}
