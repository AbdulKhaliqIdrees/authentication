import 'package:authentication/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  TextEditingController resetcontroller = TextEditingController();
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
