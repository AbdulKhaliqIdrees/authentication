import 'package:authentication/screens/reset_password_screen.dart';
import 'package:authentication/screens/target_screen.dart';
import 'package:authentication/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  login() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    try {
      if (email == "" || password == "") {
        showDialog(
            context: context,
            builder: (Builder) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Please fill all the details"),
              );
            });
      } else {
        progressDialog.show();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
            progressDialog.hide();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Target();
          }),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return showDialog(
            context: context,
            builder: (Builder) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("No User found for that Email!"),
              );
            });
      } else if (e.code == 'wrong-password') {
        return showDialog(
            context: context,
            builder: (Builder) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Wrong Password provided for that user!"),
              );
            });
      } else {
      
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
            
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Target();
          }),
        );
      }
    }
  }
 late ProgressDialog progressDialog;
  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(
      context,
      type: ProgressDialogType.normal,
      textDirection: TextDirection.rtl,
      isDismissible: true,
    );
    progressDialog.style(
     message:
          "...Loading",
    );
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
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passwordcontroller,
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
                      login();
                      emailcontroller.clear();
                      passwordcontroller.clear();
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
