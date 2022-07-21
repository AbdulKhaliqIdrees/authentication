import 'package:authentication/controllers/reset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reset extends StatelessWidget {
  final resetcontroller  = Get.put(ResetController());

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
                  controller: resetcontroller.resetcontroller,
                  decoration: InputDecoration(
                    labelText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            MaterialButton(
              onPressed: () {
                resetcontroller.reset();
                resetcontroller.resetcontroller.clear();
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
