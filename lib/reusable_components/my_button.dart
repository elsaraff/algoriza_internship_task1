import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final VoidCallback onPressed;
  final Color? color;
  final bool? infinity;
  final bool? border;
  final bool? icon;

  const MyButton({
    Key? key,
    required this.text,
    this.textSize = 20,
    this.textColor = Colors.white,
    required this.onPressed,
    this.color = Colors.teal,
    this.infinity = true,
    this.border = false,
    this.icon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: infinity! ? double.infinity : null,
      height: infinity! ? 60 : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: border!
            ? const [
                BoxShadow(color: Colors.teal, spreadRadius: 1),
              ]
            : null,
      ),
      child: MaterialButton(
        color: color,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon == true)
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  FontAwesomeIcons.google,
                  size: 23,
                  color: Colors.blueAccent,
                ),
              ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: textSize),
            ),
          ],
        ),
      ),
    );
  }
}
