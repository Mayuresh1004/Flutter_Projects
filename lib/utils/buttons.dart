import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
   Buttons({
    super.key,
    required this.text,
    required this.onPressed
    });

  final String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      color:  Colors.yellow[300],
      child: Text(text),
      
    );
  }
}