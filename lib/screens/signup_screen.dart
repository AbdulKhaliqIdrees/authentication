import 'package:authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final signupcontroller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an Account"),
      ),
      body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: signupcontroller.emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: signupcontroller.passwordcontroller,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: signupcontroller.confirmpasswordcontroller,
                    decoration: InputDecoration(
                      labelText: "Confirm Passeord",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    color: Colors.red,
                    child: Text("Create Account"),
                    onPressed: () {
                      signupcontroller.createAccount();
                      signupcontroller.emailcontroller.clear();
                      signupcontroller.passwordcontroller.clear();
                      signupcontroller.confirmpasswordcontroller.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
  
    );
  }
}
