// ignore_for_file: prefer_const_constructors

import 'package:auth/components/my_button.dart';
import 'package:auth/components/my_icon.dart';
import 'package:auth/components/my_textfield.dart';
import 'package:auth/pages/register_page.dart';
import 'package:auth/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("email not found");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('No user found!'),
        //   backgroundColor: Colors.redAccent,
        // ));
      } else if (e.code == 'wrong-password') {
        print("wrong password");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('password provided is wrong.'),
        //   backgroundColor: Colors.redAccent,
        // ));
      }
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Icon(
                  Icons.lock,
                  size: 150,
                ),
                SizedBox(
                  height: 40,
                ),
                MyTextfield(
                  controller: emailController,
                  hintText: "Email",
                  isObscure: false,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  controller: passwordController,
                  hintText: "password",
                  isObscure: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Login",
                  onTap: () {
                    signUserIn();
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Text("   Continue with   "),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyIcon(
                      onTap: () {
                        AuthServices().signInWithGoogle();
                      },
                      imageUrl: 'lib/images/google_icon.png',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MyIcon(
                      onTap: () {},
                      imageUrl: "lib/images/facebook_icon.png",
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Does not have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        " Register here.",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
