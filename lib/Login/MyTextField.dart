// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  bool isPassword;
  TextInputType inputType;

  // ignore: use_key_in_widget_constructors
  MyTextField({
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusColor: const Color.fromRGBO(210, 50, 50, 100),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 170, 41, 41)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hint,
          fillColor: Colors.transparent,
        ),
        obscureText: isPassword,
        keyboardType: inputType,
      ),
    );
  }
}