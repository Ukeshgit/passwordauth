import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui_helper.dart';
import 'package:flutter_application_1/homepage.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      uihelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      var UserCredential;
      try {
        UserCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: "flutter demo"),
              ));
        });
      } on FirebaseAuthException catch (e) {
        return uihelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("SignUp Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          uihelper.customTextField(emailcontroller, "Email", Icons.mail, false),
          uihelper.customTextField(
              passcontroller, "Password", Icons.password, true),
          SizedBox(height: 20),
          uihelper.customButton(() {
            signUp(emailcontroller.text.toString(),
                passcontroller.text.toString());
          }, "Signup"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?", style: TextStyle(fontSize: 15)),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage1(title: 'flutter demo home page'),
                        ));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
