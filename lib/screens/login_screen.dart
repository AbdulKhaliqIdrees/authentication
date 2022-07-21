import 'package:authentication/controllers/login_controller.dart';
import 'package:authentication/screens/reset_password_screen.dart';
import 'package:authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Login"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  controller: logincontroller.emailcontroller,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: logincontroller.passwordcontroller,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    color: Colors.red,
                    child: Text("Login"),
                    onPressed: () {
                      logincontroller.login();
                      logincontroller.emailcontroller.clear();
                      logincontroller.passwordcontroller.clear();
                    }),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    child: Text(
                      "Create an Account",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      Get.to(SignUp());
                    }),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(color: Colors.orange),
                    ),
                    onPressed: () {
                      Get.to(Reset());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
