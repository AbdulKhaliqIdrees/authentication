import 'package:authentication/screens/target_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  void createAccount() async {
    try {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();
      String confirmpassword = confirmpasswordcontroller.text.trim();
      if (email == "" || password == "" || confirmpassword == "") {
        Get.snackbar(
          "Error",
          "Please fill all the details!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM, 
        );
      } else if (password != confirmpassword) {
        Get.snackbar(
          "Error",
          "Password is wrong!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        Get.to(Target());
      }
    } catch (e) {
      print(e);
    }
  }
}
