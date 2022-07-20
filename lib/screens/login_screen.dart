import 'package:authentication/controllers/auth_controller.dart';
import 'package:authentication/screens/reset_password_screen.dart';
import 'package:authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Login"),
      ),
      body:  ListView(
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
                  MaterialButton(
                      color: Colors.red,
                      child: Text("Login"),
                      onPressed: () {
                        authcontroller.login();
                        authcontroller.emailcontroller.clear();
                        authcontroller.passwordcontroller.clear();
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ),
                        );
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Reset();
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
