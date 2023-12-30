import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shop/main_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInternetAvailable = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      isInternetConnected().then((value) {
        setState(() {
          isInternetAvailable = value;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: isInternetAvailable
                ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.shopping_cart,size: 40,),
                SizedBox(
                  height: 45,
                ),
                SpinKitFadingCube(
                  color: Colors.indigo,
                  size: 37.0,
                ),
              ],
            )
                : Stack(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.shopping_cart,size: 30,),
                    SizedBox(
                      height: 25,
                    ),
                    SpinKitFadingCube(
                      color: Colors.indigo,
                      size: 37.0,
                    ),
                  ],
                ),
                Positioned(
                    bottom: 35,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () => isInternetConnected(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              CupertinoIcons.refresh_thick,
                              color: Colors.red,
                              size: 29
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "خطا در اتصال به سرور",
                            style: TextStyle(
                                fontFamily: "dana",
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: Colors.red),
                          )
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}

Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      Get.offAll( MainScreen());
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
