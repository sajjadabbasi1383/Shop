import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterController registerController = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: registerController.usernameTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  hintText: 'UserName',
                  contentPadding: const EdgeInsets.all(25.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: registerController.emailTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.all(25.0),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.visibility_off,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: registerController.passwordTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFF1F1FB), width: 2.0)),
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.all(25.0),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.visibility_off,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (registerController.usernameTextEditingController.text == "") {
                    showAlertNameDialog(context);
                  } else if (registerController.emailTextEditingController.text == "") {
                    showAlertNameDialog(context);
                  } else if (registerController.passwordTextEditingController.text == "") {
                    showAlertNameDialog(context);
                  } else {
                    registerController.registration();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF1257FA),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                ),
                child: const Text('Sign UP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertNameDialog(BuildContext context) {
  var textTheme = Theme.of(context).textTheme;
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "باشه",
      style: textTheme.titleSmall,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "لطفا نام و نام خانوادگی را وارد کنید.",
      style: textTheme.titleSmall,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
