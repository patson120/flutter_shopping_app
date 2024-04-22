import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/app_colors.dart';
import 'package:shopping/core/app_sizes.dart';
import 'package:shopping/models/response/product_model.dart';
import 'package:shopping/routes/app_router.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function()? addToCart;
  const ProductCard({
    Key? key,
    required this.product,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.PRODUCT, arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kDefaultMargin * 1.5),
        padding: const EdgeInsets.all(5),
        height: 225,
        width: Get.width / 2 - 32,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 20,
              color: kTextColor.withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product.thumbnail!),
                          ))),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kTextColor2.withOpacity(.8),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                        ),
                        child: Text(
                          "${product.price!} £",
                          style: const TextStyle(
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: kDarkColor.withOpacity(0.7),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.room,
                                color: kOrangeColor, size: 16),
                            Text(
                              "Rating ${product.rating!}",
                              style: const TextStyle(
                                color: kWhiteColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!.toString().capitalizeFirst!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      product.description!.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    Row(children: [
                      const Spacer(),
                      InkWell(
                        onTap: addToCart,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: kOrangeColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
