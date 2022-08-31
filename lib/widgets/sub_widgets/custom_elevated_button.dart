import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatefulWidget {
  late String text = '';
  late double fontSize = 0;
  late double elevation = 0;

  CustomElevatedButton(
      {Key? key, required this.text, double? fontSize, double? elevation})
      : super(key: key) {
    this.fontSize = fontSize ?? 18;
    this.elevation = elevation ?? 0;
  }

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(widget.elevation),
          backgroundColor: MaterialStateProperty.all<Color>(isPressed
              ? Colors.white
              : const Color.fromARGB(255, 26, 34, 37))),
      child: Text(widget.text,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: isPressed
                  ? const Color.fromARGB(255, 26, 34, 37)
                  : Colors.white)),
      onPressed: () => {setState(() => isPressed = true)},
    );
  }
}
