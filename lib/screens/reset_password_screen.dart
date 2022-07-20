import 'package:authentication/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reset extends StatelessWidget {
  final authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Page",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
             TextField(
                  controller: authcontroller.resetcontroller,
                  decoration: InputDecoration(
                    labelText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            MaterialButton(
              onPressed: () {
                authcontroller.reset();
                authcontroller.resetcontroller.clear();
              },
              color: Colors.red,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
