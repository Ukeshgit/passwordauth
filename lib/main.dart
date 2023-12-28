import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          // useMaterial3: true,
          ),
      home: MyHomePage1(title: 'flutter Demo Home page'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage1> createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text("Login Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uihelper.customTextField(
                emailcontroller, "Email", Icons.mail, false),
            uihelper.customTextField(
                passcontroller, "Password", Icons.password, true),
            SizedBox(height: 20.0),
            uihelper.customButton(() {}, "Login"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" Don't have an Account?", style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupPage()));
                    },
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ))
              ],
            )
          ],
        ));
  }
}
