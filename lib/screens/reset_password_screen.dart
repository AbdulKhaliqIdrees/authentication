import 'package:authentication/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  TextEditingController resetcontroller = TextEditingController();
  reset() async {
    try {
      String email = resetcontroller.text.trim();
      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SignUp();
              }),
            ),
          );
    } catch (e) {
      print(e);
    }
  }

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
              controller: resetcontroller,
              decoration: InputDecoration(
                labelText: "Enter your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                reset();
                resetcontroller.clear();
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
