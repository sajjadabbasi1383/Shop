import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shop/view/product_info_screen.dart';
import '../controller/home_controller.dart';
import '../controller/product_info_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final HomeController homeController = Get.put(HomeController());
  final ProductInfoController productInfoController = Get.put(ProductInfoController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        productInfoController.basketList.isNotEmpty
            ? SizedBox(
          height: Get.height / 1.4,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: productInfoController.basketList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return productItem(index);
            },
          ),
        )
            : const Center(child: Text("Your shopping cart is empty"),),
      ],
    ));
  }

  Widget productItem(int index) {
    return Obx(
          () => Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            productInfoController.id.value=int.parse(productInfoController.basketList[index].id.toString());
            Get.to(const ProductInfoScreen());
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(17))),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width / 3.5,
                  height: Get.height / 7,
                  child: CachedNetworkImage(
                    imageUrl: productInfoController.basketList[index].image!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    placeholder: (context, url) => const SpinKitFadingCube(
                      color: Colors.indigo,
                      size: 27,
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 1.7,
                      child: Text(
                        productInfoController.basketList[index].title!,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$ ${productInfoController.basketList[index].price!}",
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "${productInfoController.basketList[index].discountPercentage!}%",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Text(
                              productInfoController.basketList[index].rating!,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                            onTap: () {
                              productInfoController.removeProductFromBasket(index);
                            },
                            child: const Icon(Icons.remove_shopping_cart)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
