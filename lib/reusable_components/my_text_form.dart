import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool? isPassword;
  final String? label;
  final String? hint;
  final IconData? prefix;
  final IconData? suffix;
  final Function? suffixPressed;

  const MyTextForm({
    Key? key,
    required this.text,
    required this.controller,
    required this.textInputType,
    this.isPassword = false,
    this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: const TextStyle(fontSize: 18),
        obscureText: isPassword!,
        controller: controller,
        keyboardType: textInputType,
        cursorColor: Colors.black,
        validator: (value) {
          if (value!.isEmpty) {
            return '$text is Empty';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  color: Colors.teal,
                )
              : null,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                    color: isPassword! ? Colors.black : Colors.teal,
                  ),
                )
              : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
