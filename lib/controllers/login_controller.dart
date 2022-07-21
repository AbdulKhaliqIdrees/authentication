import 'package:authentication/screens/target_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void login() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    try {
      if (email == "" || password == "") {
        Get.snackbar(
          "Error",
          "Please fill all the details!",
          backgroundColor: Colors.red,
        );
      } else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.to(Target());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email!",
          backgroundColor: Colors.red,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Password is wrong for that user!",
          backgroundColor: Colors.red,
        );
      } else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        Get.to(Target());
      }
    }
  }
}
