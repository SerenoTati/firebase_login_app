import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChange,
    this.isPassword = false,
  }) : super(key: key);
  final String hintText;
  final bool isPassword;
  final IconData icon;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        icon: Icon(icon),
      ),
    );
  }
}
