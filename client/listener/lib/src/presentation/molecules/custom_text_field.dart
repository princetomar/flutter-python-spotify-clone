import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsecureText;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      obscureText: isObsecureText,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
    );
  }
}
