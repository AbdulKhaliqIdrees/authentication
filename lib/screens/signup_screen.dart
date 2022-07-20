import 'package:authentication/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final authcontroller = Get.put(AuthController());
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
                    controller: authcontroller.emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: authcontroller.passwordcontroller,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: authcontroller.confirmpasswordcontroller,
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
                      authcontroller.createAccount();
                      authcontroller.emailcontroller.clear();
                      authcontroller.passwordcontroller.clear();
                      authcontroller.confirmpasswordcontroller.clear();
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
