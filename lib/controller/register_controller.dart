import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/view/profile_screen.dart';

import '../view/main_screen.dart';

class RegisterController extends GetxController {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  var username="";
  var email="";
  var password="";

  var box = GetStorage();

  registration(){

    username=usernameTextEditingController.text;
    email=emailTextEditingController.text;
    password=passwordTextEditingController.text;

    box.write('username', username);
    box.write('email', email);
    box.write('password', password);

    debugPrint("read::::${box.read('username')}");
    debugPrint("read::::${box.read('email')}");
    debugPrint("read::::${box.read('password')}");

    Get.offAll(MainScreen());
  }

  logOut(){
    box.erase();
    Get.offAll(MainScreen());
  }

}
