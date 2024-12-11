import 'package:auth/components/my_button.dart';
import 'package:auth/components/my_textfield.dart';
import 'package:auth/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void createNewUser()async{
    try {
      if(passwordController.text!= confirmPasswordController.text){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('passwords do not match'),backgroundColor: Colors.redAccent,));
      }
      else if(emailController.text.isEmpty||passwordController.text.isEmpty||confirmPasswordController.text.isEmpty){
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All fields are required'),backgroundColor: Colors.redAccent,));
      }
      else{
        // ignore: unused_local_variable
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      }
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
            
                const SizedBox(height: 40,),
            
                const Icon(Icons.lock, size: 110 ,),
            
                const SizedBox(height: 40,),
            
                MyTextfield(
                  controller: emailController,
                  hintText: "Email",
                  isObscure: false,
                ),
            
                const SizedBox(height: 20,),
            
                MyTextfield(
                  controller: passwordController,
                  hintText: " create password",
                  isObscure: true,
                ),
            
                const SizedBox(height: 20,),
            
                MyTextfield(
                  controller: confirmPasswordController,
                  hintText: "confirm password",
                  isObscure: true,
                ),
            
            
                const SizedBox(height: 30,),
            
                MyButton(
                  text: "Signup",
                  onTap: () {
                    createNewUser();
                  },
                ),
            
            
               
            
                const SizedBox(height: 50,),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      },
                      child: const Text(" Continue to login.",style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),),
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