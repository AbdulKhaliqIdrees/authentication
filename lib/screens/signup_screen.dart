import 'package:authentication/screens/target_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  createAccount() async {
    try {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();
      String confirmpassword = confirmpasswordcontroller.text.trim();
      if (email == "" || password == "" || confirmpassword == "") {
        return showDialog(
            context: context,
            builder: (Builder) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Please fill all the details!"),
              );
            });
      } else if (password != confirmpassword) {
        return showDialog(
            context: context,
            builder: (Builder) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Password is worng!"),
              );
            });
      } else {
        progressDialog.show();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      progressDialog.hide();
        return Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Target();
        }));
      }
    } catch (e) {
      print(e);
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
        title: Text("Create an Account"),
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
                TextField(
                  controller: confirmpasswordcontroller,
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
                    createAccount();
                    emailcontroller.clear();
                    passwordcontroller.clear();
                    confirmpasswordcontroller.clear();
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
