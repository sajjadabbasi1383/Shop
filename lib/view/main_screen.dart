import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/view/profile_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  final RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.search, color: Colors.black),
              const Text(
                "Online Shop",
                style: TextStyle(fontFamily: "dana", fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.white,
                height: 25,
                width: 28,
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children:  [
                  HomeScreen(),
                  const ProfileScreen(),
                ],
              ),
            )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  Container(
                    height: Get.size.height / 11,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  BottomNavBar(
                    changeScreen: (int value) {
                      selectedPageIndex.value = value;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
    required this.changeScreen,
  });

  var bodyMargin = Get.size.width / 10;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Container(
              height: Get.size.height / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 25, 0, 94),
                    Colors.indigo,
                  ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => changeScreen(1),
                      icon: const ImageIcon(AssetImage("assets/icons/user.png"),
                          color: Colors.white)),
                  IconButton(
                      onPressed: () => changeScreen(0),
                      icon: const ImageIcon(
                        AssetImage("assets/icons/home.png"),
                        color: Colors.white,
                      )),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
