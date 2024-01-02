import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/register_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var username = GetStorage().read('username') ?? "sajjad";
    var email = GetStorage().read('email') ?? 'sajjadabbasi@gmail.com';
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Image.asset(
              "assets/images/profileAvatar.png",
              height: 100,
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "UserName:   ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(username,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17)),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Email:   ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(email,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17)),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              color: const Color.fromARGB(255, 112, 112, 112),
              indent: Get.size.width / 7,
              endIndent: Get.size.width / 7,
              thickness: 1.2,
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.indigo,
              child: SizedBox(
                height: 45,
                width: Get.size.width / 1.17,
                child: const Center(child: Text("My Favorite Product")),
              ),
            ),
            Divider(
              color: const Color.fromARGB(255, 112, 112, 112),
              indent: Get.size.width / 7,
              endIndent: Get.size.width / 7,
              thickness: 1.2,
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.indigo,
              child: SizedBox(
                height: 45,
                width: Get.size.width / 1.17,
                child: const Center(child: Text("Edit UserName")),
              ),
            ),
            Divider(
              color: const Color.fromARGB(255, 112, 112, 112),
              indent: Get.size.width / 7,
              endIndent: Get.size.width / 7,
              thickness: 1.2,
            ),
            InkWell(
              onTap: () {
                showLogOutAlertDialog(context);
              },
              splashColor: Colors.indigo,
              child: SizedBox(
                height: 45,
                width: Get.size.width / 1.17,
                child: const Center(child: Text("Log Out")),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

showLogOutAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Yes",
        style: TextStyle(
            fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold)),
    onPressed: () {
      Get.find<RegisterController>().logOut();
    },
  );

  Widget cancelButton = TextButton(
    child: const Text("No!",
        style: TextStyle(
            fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold)),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Do you want to log out of your account?",
        style: TextStyle(
          fontSize: 16,
          color: Colors.indigo,
        )),
    actions: [cancelButton,okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
