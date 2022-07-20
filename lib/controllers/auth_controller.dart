import 'package:authentication/screens/login_screen.dart';
import 'package:authentication/screens/target_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit(){
    createAccount();
    login();
    reset();
    super.onInit();
  }
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController resetcontroller = TextEditingController();
  void createAccount() async {
    try {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();
      String confirmpassword = confirmpasswordcontroller.text.trim();
      if (email == "" || password == "" || confirmpassword == "") {
        Get.snackbar("Error", "Please fill all the details!");
      } else if (password != confirmpassword) {
        Get.snackbar("Error", "Password is wrong!");
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        Get.to(Target());
      }
    } catch (e) {
      print(e);
    }

    void login() async {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();
      try {
        if (email == "" || password == "") {
          Get.snackbar("Error", "Please fill all the details!");
        } else {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          Get.to(Target());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Error", "No user found for that email!");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error", "Password is wrong for that user!");
        } else {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          Get.to(Target());
        }
      }
    }

    void reset() async {
      try {
        String email = resetcontroller.text.trim();
        FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
              (value) => Get.to(Login()),
            );
      } catch (e) {
        print(e);
      }
    }
  }

  void login() {}

  void reset() {}
}
