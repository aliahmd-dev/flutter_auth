import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  TextEditingController? controller;

  MyTextfield({
    super.key,
    required this.hintText,
    required this.isObscure,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      
    
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade100,
    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 187, 187, 187),
            width: 2,
          ), 
          
        ),
      ),
      obscureText: isObscure,
    
    );
  }
}
