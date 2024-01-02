import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/view/cart_screen.dart';

import '../controller/home_controller.dart';
import '../controller/product_info_controller.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  final HomeController homeController = Get.put(HomeController());
  final ProductInfoController productInfoController =
      Get.put(ProductInfoController());

  @override
  void initState() {
    super.initState();
    productInfoController.getProductInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => productInfoController.productInfoModel.value.title == null
            ? SizedBox(
                height: Get.height,
                child: const SpinKitFadingCube(
                  color: Colors.indigo,
                  size: 40,
                ),
              )
            : Stack(children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    width: Get.size.width,
                    height: Get.height/1.1,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: productInfoController
                                  .productInfoModel.value.image!,
                              imageBuilder: (context, imageProvider) => Image(
                                image: imageProvider,
                                height: Get.size.height / 3,
                                fit: BoxFit.fill,
                                width: Get.size.width,
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  height: 70,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.indigo,
                                            Color.fromARGB(0, 0, 0, 0)
                                          ])),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: 35,
                                          height: 35,
                                          child: const Icon(
                                            Icons.arrow_back,
                                            size: 26,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      const Icon(
                                        Icons.bookmark_outline,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        width: 35,
                                        height: 35,
                                        child: const Icon(
                                          Icons.share,
                                          size: 21,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            productInfoController.productInfoModel.value.title!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 35,
                                  ),
                                  Text(
                                    productInfoController
                                        .productInfoModel.value.rating!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Stock: ${productInfoController.productInfoModel.value.stock!}",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Category: ",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        productInfoController
                                            .productInfoModel.value.category!,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Brand: ",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.indigoAccent,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        productInfoController
                                            .productInfoModel.value.brand!,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 30),
                          child: Text(
                            productInfoController
                                .productInfoModel.value.description!,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: Get.size.width,
              height: Get.size.height / 9.1,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 22, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.size.width/2.5,
                      child: Row(
                        children: [
                          Column(
                          children: [
                            const Text(
                              "Total Price",
                              style: TextStyle(
                                color: Color.fromARGB(140, 0, 0, 0),
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              "\$${productInfoController.productInfoModel.value.price!}",
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                            ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text("${productInfoController.productInfoModel.value.discountPercentage!}%",style: const TextStyle(color: Colors.white),),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        productInfoController.addProductToBasket(productInfoController.productInfoModel.value);
                        Get.back();
                      },
                      child: Container(
                        width: 88,
                        height: 88,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
              ]),
      ),
    ));
  }
}
