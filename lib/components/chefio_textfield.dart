import 'package:flutter/material.dart';

class ChefioTextField extends StatelessWidget {
  final String? hintText;
  final String? leadingIcon;
  final TextInputType inputType;

  const ChefioTextField(
      {super.key,
      this.hintText,
      this.leadingIcon,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
