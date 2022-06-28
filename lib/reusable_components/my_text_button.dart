import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final VoidCallback onPressed;
  const MyTextButton({
    Key? key,
    required this.text,
    this.textSize = 20,
    this.textColor = Colors.blueAccent,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: textSize, color: textColor),
        ));
  }
}
